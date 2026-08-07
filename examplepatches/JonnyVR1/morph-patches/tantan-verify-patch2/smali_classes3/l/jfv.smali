.class public Ll/jfv;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

.field public d:Ll/dgu;

.field public e:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jfv;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/jfv;->b:Lrx/subjects/a;

    .line 16
    .line 17
    new-instance v0, Ll/dgu;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/dgu;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/jfv;->d:Ll/dgu;

    .line 23
    .line 24
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/jfv;->e:Lrx/subjects/b;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jfv;->d:Ll/dgu;

    .line 2
    .line 3
    const-string v0, "scene_inner_live_room"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/dgu;->a(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfv;->d:Ll/dgu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgu;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfv;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jfv;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/intl/api/IntlLivingNormalApiProvider;->requestBubble()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->f7()V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/jfv;->b:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jfv;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jfv;->j()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->downGrade:Z

    .line 10
    .line 11
    return p0
.end method

.method public g()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jfv;->e:Lrx/subjects/b;

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

.method public h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfv;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 8
    .line 9
    return-object p0
.end method

.method public i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfv;->d:Ll/dgu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgu;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfv;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfv;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/util/List;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jfv;->d:Ll/dgu;

    .line 2
    .line 3
    const-string v0, "scene_inner_live_room"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/dgu;->d(Ljava/util/List;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jfv;->d:Ll/dgu;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dgu;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/jfv;->e:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
