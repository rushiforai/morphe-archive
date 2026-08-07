.class public Ll/xk9;
.super Ll/xi5;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/xi5;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xi5;-><init>(Lcom/tantanapp/common/network/RunnerProxy;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/Link;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Link;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Link;

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 23
    .line 24
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 25
    .line 26
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 31
    .line 32
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 33
    .line 34
    :cond_1
    return-object p1
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/data/Link;)Ll/x1d0;
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
    const-string v1, "/links"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->p(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Link;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Link;
    .locals 1

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/l9c;->u(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 6
    .line 7
    .line 8
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/data/Link;

    .line 24
    .line 25
    return-object p0
.end method

.method public static synthetic z(Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)Ll/x1d0;
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
    const-string v2, "/links/"

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
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/xi5;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Link;->toJson()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method


# virtual methods
.method public B(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Link;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Link;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "published"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkState;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 13
    .line 14
    new-instance v1, Ll/ti20;

    .line 15
    .line 16
    new-instance v2, Ll/vk9;

    .line 17
    .line 18
    invoke-direct {v2, p1, v0}, Ll/vk9;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v1, v2}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/wk9;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/wk9;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {}, Ll/xi5;->w()Lrx/c$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public C(Lcom/p1/mobile/putong/data/Link;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Link;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Link;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/tk9;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/tk9;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/uk9;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ll/uk9;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Ll/xi5;->w()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
