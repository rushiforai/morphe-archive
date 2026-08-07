.class public abstract Ll/vp20;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ipl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ipl<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/jsv;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ipl;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ipl<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/qfu;->b:Ll/qfu;

    .line 5
    .line 6
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 11
    .line 12
    iput-object p1, p0, Ll/vp20;->a:Ll/ipl;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic c(Ll/jsv;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    check-cast p0, Ll/j2t;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/j2t;->m()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic d(Ll/jsv;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    check-cast p0, Ll/j2t;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/j2t;->l()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic e(Ll/gcg0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/vp20;Ll/jsv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vp20;->t(Ll/jsv;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/Throwable;

    .line 4
    .line 5
    const-string p1, "live is null"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Ll/vp20;->a:Ll/ipl;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/ipl;->n(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h(Ll/jsv;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Ll/vp20;->a:Ll/ipl;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/ipl;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp20;->a:Ll/ipl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ipl;->l()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp20;->a:Ll/ipl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ipl;->getLiveId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/jsv;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()Ll/jsv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jsv;

    .line 8
    .line 9
    return-object p0
.end method

.method public n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp20;->a:Ll/ipl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ipl;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp20;->a:Ll/ipl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ipl;->getRoomId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public abstract p()Z
.end method

.method public q()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/jsv;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/jsv;->c()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic t(Ll/jsv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vp20;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1, p0}, Ll/jsv;->i(Z)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public u()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/jsv;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/rp20;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/rp20;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 18
    .line 19
    new-instance v0, Ll/sp20;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/sp20;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public v()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/jsv;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v0, Ll/up20;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/up20;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public w(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vp20;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public x()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vp20;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/vp20;->c:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/vp20;->c:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0
.end method

.method public y()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/jsv;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/tp20;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tp20;-><init>(Ll/vp20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
