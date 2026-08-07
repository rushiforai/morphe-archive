.class public Ll/m6n;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/ChatBlockStatus;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dy6;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/m6n;->R:Lrx/subjects/a;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a3(Ll/m6n;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatBlockEnvelope;)Lcom/p1/mobile/putong/core/data/ChatBlockStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m6n;->e3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatBlockEnvelope;)Lcom/p1/mobile/putong/core/data/ChatBlockStatus;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Ll/m6n;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m6n;->f3(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->m(Ljava/lang/String;)Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public d3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/ChatBlockStatus;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "chat_block_status_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/j6n;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/j6n;-><init>(Ll/m6n;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, v0, p1, v1, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic e3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatBlockEnvelope;)Lcom/p1/mobile/putong/core/data/ChatBlockStatus;
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatBlockEnvelope;->data:Lcom/p1/mobile/putong/core/data/ChatBlockData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatBlockData;->status:Lcom/p1/mobile/putong/core/data/ChatBlockStatus;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/m6n;->g3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatBlockStatus;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatBlockEnvelope;->data:Lcom/p1/mobile/putong/core/data/ChatBlockData;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatBlockData;->status:Lcom/p1/mobile/putong/core/data/ChatBlockStatus;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p2, "UNLOCKED"

    .line 20
    .line 21
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/ChatBlockStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatBlockStatus;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, p1, v0}, Ll/m6n;->g3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatBlockStatus;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/ChatBlockStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatBlockStatus;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final synthetic f3(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/k6n;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/k6n;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatBlockEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/l6n;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/l6n;-><init>(Ll/m6n;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public g3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatBlockStatus;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m6n;->R:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/m6n;->R:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
