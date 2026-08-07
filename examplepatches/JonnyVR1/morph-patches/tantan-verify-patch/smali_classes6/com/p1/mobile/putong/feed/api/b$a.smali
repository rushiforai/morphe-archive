.class public Lcom/p1/mobile/putong/feed/api/b$a;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/api/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Ljava/util/List<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field public h:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public final synthetic i:Lcom/p1/mobile/putong/feed/api/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/api/b;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/api/b$a;->i:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    new-instance v0, Ll/dji;

    .line 4
    .line 5
    new-instance v1, Ll/vod;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

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
    const-string v3, "muted_users_protobuf"

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, 0x7

    .line 28
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Lcom/p1/mobile/putong/feed/api/b$a$a;

    .line 32
    .line 33
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/feed/api/b$a$a;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "mutedUsers"

    .line 37
    .line 38
    invoke-direct {p0, p1, v2, v0, v1}, Ll/mof0;-><init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 39
    .line 40
    .line 41
    new-instance p1, Landroid/util/LruCache;

    .line 42
    .line 43
    const/16 v0, 0xa

    .line 44
    .line 45
    invoke-direct {p1, v0}, Landroid/util/LruCache;-><init>(I)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/api/b$a;->h:Landroid/util/LruCache;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b$a;->K(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic D(Ljava/lang/String;Z)Ll/x1d0;
    .locals 1

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
    invoke-static {p0}, Ll/dog;->H(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    const-string v0, ""

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/x1d0$a;->m(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/x1d0$a;->d()Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :goto_0
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic E(Ljava/util/List;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, p0, v1}, Ll/cr00;->N(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b$a;->I(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b$a;->L(Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b$a;->J(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic I(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, p1, v1}, Ll/cr00;->K(Ljava/lang/String;Z)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/b$a;->h:Landroid/util/LruCache;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 22
    .line 23
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, p1, v0}, Ll/cr00;->O(Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic J(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/jz9;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/jz9;-><init>(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Ljava/util/List;

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    new-instance p2, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {p2, p1}, Ll/jyb;->c(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    return-object p0
.end method

.method public final synthetic K(Ljava/lang/String;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/api/b$a;->h:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/api/b$a;->h:Landroid/util/LruCache;

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Ljava/util/List;

    .line 20
    .line 21
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/kz9;

    .line 26
    .line 27
    invoke-direct {v1, p2}, Ll/kz9;-><init>(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ljava/util/List;

    .line 38
    .line 39
    if-nez p2, :cond_1

    .line 40
    .line 41
    new-instance p2, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-static {p2, p1}, Ll/jyb;->c0(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic L(Ljava/lang/String;Z)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/fz9;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/fz9;-><init>(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    new-instance p2, Ll/ti20;

    .line 9
    .line 10
    invoke-direct {p2, v0}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/gz9;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/gz9;-><init>(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    new-instance p2, Ll/ti20;

    .line 32
    .line 33
    invoke-direct {p2, v0}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/hz9;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/hz9;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance v0, Ll/iz9;

    .line 46
    .line 47
    invoke-direct {v0, p0, p1}, Ll/iz9;-><init>(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public M(Ljava/lang/String;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/api/b$a;->i:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    new-instance v1, Ll/ez9;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/ez9;-><init>(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    const-string p0, "mute"

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
