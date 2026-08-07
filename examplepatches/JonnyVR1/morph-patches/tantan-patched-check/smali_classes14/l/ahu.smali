.class public Ll/ahu;
.super Ll/l6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ll/l6t<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/knu;


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/knu;->d:Ll/ner;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/l6t;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/ahu;->e:Ll/knu;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic D2(Ll/y20;Ll/v3f$b;Ljava/lang/Object;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    new-instance p0, Ljava/lang/Throwable;

    .line 6
    .line 7
    new-instance p2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "live event handle error, event is "

    .line 10
    .line 11
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ll/v3f$b;->d()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic E2(Ll/qcj;Ll/hk2;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Ll/hk2;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public F2(Ljava/lang/Class;Ll/qcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ll/hk2<",
            "TR;>;R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ll/qcj<",
            "TT;TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ahu;->P2()Ll/u3z;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/u3z;->e(Ljava/lang/Class;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/zgu;

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ll/zgu;-><init>(Ll/qcj;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public H2()Ll/xnu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahu;->e:Ll/knu;

    .line 2
    .line 3
    iget-object p0, p0, Ll/knu;->e:Ll/xnu;

    .line 4
    .line 5
    return-object p0
.end method

.method public I2(Ll/v3f$b;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/v3f$b<",
            "TT;",
            "Lrx/c<",
            "TT;>;>;",
            "Ll/y20<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lrx/c;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v0, Ll/ygu;

    .line 13
    .line 14
    invoke-direct {v0, p2, p1}, Ll/ygu;-><init>(Ll/y20;Ll/v3f$b;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahu;->e:Ll/knu;

    .line 2
    .line 3
    iget-object p0, p0, Ll/knu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 4
    .line 5
    return-object p0
.end method

.method public L2(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, 0x0

    .line 15
    sget v0, Ll/q7c0;->c:I

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public M2()Ll/knu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahu;->e:Ll/knu;

    .line 2
    .line 3
    return-object p0
.end method

.method public N2()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahu;->e:Ll/knu;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/knu;->f:Z

    .line 4
    .line 5
    return p0
.end method

.method public P2()Ll/u3z;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahu;->e:Ll/knu;

    .line 2
    .line 3
    iget-object p0, p0, Ll/knu;->c:Ll/u3z;

    .line 4
    .line 5
    return-object p0
.end method

.method public Q2(Ll/hk2;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/hk2<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ahu;->P2()Ll/u3z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/u3z;->k(Ll/wpl;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/hk2;->b()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ahu;->e:Ll/knu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/knu;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
