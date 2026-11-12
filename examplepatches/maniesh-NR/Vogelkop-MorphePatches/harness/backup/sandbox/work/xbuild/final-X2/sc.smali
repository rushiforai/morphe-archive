.class public abstract Lsc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/String;Loam;)V
    .registers 4

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, p2, p3}, Lsc;->e(Landroid/view/View;Ljava/lang/String;Loam;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 31
    iput-object p1, p0, Lsc;->a:Ljava/lang/Object;

    iput-object p2, p0, Lsc;->b:Ljava/lang/Object;

    iput-object p3, p0, Lsc;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lx5f;)V
    .registers 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsc;->a:Ljava/lang/Object;

    .line 29
    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p1, p0, Lsc;->b:Ljava/lang/Object;

    .line 30
    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p1, p0, Lsc;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ly5i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsc;->a:Ljava/lang/Object;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lsc;->b:Ljava/lang/Object;

    new-instance p1, Lj3i;

    const/16 v0, 0x18

    invoke-direct {p1, p0, v0}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lsc;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Lsc;->a:Ljava/lang/Object;

    check-cast v0, Luio;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Luio;->c()V

    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lsc;->a:Ljava/lang/Object;

    iput-object v0, p0, Lsc;->b:Ljava/lang/Object;

    iput-object v0, p0, Lsc;->c:Ljava/lang/Object;

    return-void
.end method

.method public b(I)V
    .registers 2

    return-void
.end method

.method public final c(Landroid/view/View;)V
    .registers 3

    iget-object p0, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p0, Luio;

    if-eqz p0, :cond_22

    iget-boolean v0, p0, Luio;->g:Z

    if-nez v0, :cond_22

    iget-object p0, p0, Luio;->c:Lozo;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_1d

    invoke-virtual {p0, p1}, Lozo;->a(Landroid/view/View;)Lwxo;

    move-result-object p1

    if-eqz p1, :cond_22

    iget-object p0, p0, Lozo;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :cond_1d
    const-string p0, "FriendlyObstruction is null"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :cond_22
    return-void
.end method

.method public final d(Landroid/view/View;Lpp9;Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p0, Luio;

    if-nez p0, :cond_7

    return-void

    :cond_7
    :try_start_7
    invoke-virtual {p0, p1, p2, p3}, Luio;->a(Landroid/view/View;Lpp9;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_a} :catch_b

    return-void

    :catch_b
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    return-void
.end method

.method public e(Landroid/view/View;Ljava/lang/String;Loam;)V
    .registers 6

    sget-object v0, Lu06;->e:Lu06;

    invoke-static {v0, p2, p3}, Lcoh;->d(Lu06;Ljava/lang/String;Loam;)Luio;

    move-result-object p2

    iput-object p2, p0, Lsc;->a:Ljava/lang/Object;

    if-nez p2, :cond_b

    return-void

    :cond_b
    invoke-virtual {p2, p1}, Luio;->d(Landroid/view/View;)V

    iget-object p1, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p1, Luio;

    invoke-static {p1}, Lzy9;->J(Luio;)Lzy9;

    move-result-object p1

    iput-object p1, p0, Lsc;->b:Ljava/lang/Object;

    iget-object p1, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p1, Luio;

    invoke-static {p1}, Lqe6;->K(Luio;)Lqe6;

    move-result-object p1

    iput-object p1, p0, Lsc;->c:Ljava/lang/Object;

    iget-object p1, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p1, Luio;

    invoke-virtual {p1}, Luio;->e()V

    sget-object p1, Lhog;->b:Lhog;

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Lzy9;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    invoke-static {p0}, Lzch;->j(Luio;)V

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    const/4 p3, 0x1

    :try_start_42
    const-string v0, "skippable"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v0, "autoPlay"

    invoke-virtual {p2, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v0, "position"

    invoke-virtual {p2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_52
    .catch Lorg/json/JSONException; {:try_start_42 .. :try_end_52} :catch_52

    :catch_52
    iget-boolean p1, p0, Luio;->j:Z

    if-nez p1, :cond_6c

    iget-object p1, p0, Luio;->e:Lyp;

    sget-object v0, Lqii;->p:Lqii;

    invoke-virtual {p1}, Lyp;->g()Landroid/webkit/WebView;

    move-result-object v1

    iget-object p1, p1, Lyp;->a:Ljava/lang/String;

    filled-new-array {p2, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "publishLoadedEvent"

    invoke-virtual {v0, v1, p2, p1}, Lqii;->m(Landroid/webkit/WebView;Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean p3, p0, Luio;->j:Z

    return-void

    :cond_6c
    const-string p0, "Loaded event can only be sent once"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final f()Lap9;
    .registers 5

    iget-object v0, p0, Lsc;->a:Ljava/lang/Object;

    check-cast v0, Ly5i;

    invoke-virtual {v0}, Ly5i;->a()V

    iget-object v1, p0, Lsc;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lap9;

    return-object p0

    :cond_1e
    invoke-virtual {p0}, Lsc;->j()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ly5i;->a()V

    invoke-virtual {v0}, Ly5i;->b()V

    invoke-virtual {v0}, Ly5i;->i()Lqsk;

    move-result-object v0

    invoke-interface {v0}, Lqsk;->getWritableDatabase()Lto9;

    move-result-object v0

    invoke-virtual {v0, p0}, Lto9;->l(Ljava/lang/String;)Lap9;

    move-result-object p0

    return-object p0
.end method

.method public g()V
    .registers 4

    iget-object p0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast p0, Lqe6;

    if-eqz p0, :cond_20

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "interactionType"

    sget-object v2, Lsdb;->b:Lsdb;

    invoke-static {v0, v1, v2}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string v1, "adUserInteraction"

    invoke-virtual {p0, v1, v0}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    :cond_20
    return-void
.end method

.method public h()V
    .registers 1

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Lzy9;

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Lzy9;->L()V

    :cond_9
    return-void
.end method

.method public i(Ljf;)Lrc;
    .registers 4

    new-instance v0, Lrc;

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Lpc;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lrc;-><init>(Lpc;Ljf;Z)V

    return-object v0
.end method

.method public abstract j()Ljava/lang/String;
.end method

.method public final k(Ljava/lang/Object;Z)V
    .registers 5

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/WeakHashMap;

    if-eqz p2, :cond_26

    new-instance p2, Lm3g;

    const/16 v0, 0xe

    invoke-direct {p2, v0}, Lm3g;-><init>(B)V

    new-instance v0, Lmn;

    const/16 v1, 0xf

    invoke-direct {v0, p2, v1}, Lmn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lneg;

    if-eqz p0, :cond_31

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lneg;->a:J

    const/4 p1, 0x0

    iput-boolean p1, p0, Lneg;->b:Z

    return-void

    :cond_26
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lneg;

    if-eqz p0, :cond_31

    invoke-virtual {p0}, Lneg;->a()V

    :cond_31
    return-void
.end method

.method public final l(Ljava/lang/Object;ZZ)V
    .registers 13

    iget-object v0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/WeakHashMap;

    iget-object v1, p0, Lsc;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/WeakHashMap;

    if-eqz p2, :cond_34

    if-eqz p3, :cond_2b

    new-instance p0, Lm3g;

    const/16 p2, 0xf

    invoke-direct {p0, p2}, Lm3g;-><init>(B)V

    new-instance p2, Lmn;

    const/16 p3, 0x10

    invoke-direct {p2, p0, p3}, Lmn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lneg;

    if-eqz p0, :cond_2b

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p2

    iput-wide p2, p0, Lneg;->a:J

    const/4 p2, 0x0

    iput-boolean p2, p0, Lneg;->b:Z

    :cond_2b
    new-instance p0, Loeg;

    invoke-direct {p0}, Loeg;-><init>()V

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_34
    if-eqz p3, :cond_41

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lneg;

    if-eqz p2, :cond_41

    invoke-virtual {p2}, Lneg;->a()V

    :cond_41
    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lneg;

    const-wide/16 v1, 0x0

    if-eqz p2, :cond_4f

    iget-wide p2, p2, Lneg;->c:J

    move-wide v5, p2

    goto :goto_50

    :cond_4f
    move-wide v5, v1

    :goto_50
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loeg;

    if-eqz p1, :cond_61

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p2

    iget-wide v3, p1, Loeg;->a:J

    sub-long/2addr p2, v3

    move-wide v7, p2

    goto :goto_62

    :cond_61
    move-wide v7, v1

    :goto_62
    cmp-long p1, v7, v1

    if-lez p1, :cond_7b

    cmp-long p1, v7, v5

    if-ltz p1, :cond_7b

    iget-object p0, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_7b

    new-instance v3, Lk5f;

    const/4 v4, 0x0

    invoke-direct/range {v3 .. v8}, Lk5f;-><init>(BJJ)V

    invoke-virtual {p0, v3}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_7b
    return-void
.end method

.method public final m(Lap9;)V
    .registers 3

    iget-object v0, p0, Lsc;->c:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lap9;

    if-ne p1, v0, :cond_14

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_14
    return-void
.end method

.method public final n(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lneg;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Lneg;->a()V

    :cond_f
    return-void
.end method
