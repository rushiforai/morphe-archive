.class public Ll/mus;
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
.field public final e:Ll/nus;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l6t;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/mus;->e:Ll/nus;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic D2(Ll/qcj;Ll/hk2;)V
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
.method public E2(Ljava/lang/Class;Ll/qcj;)V
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
    invoke-virtual {p0}, Ll/mus;->K2()Ll/u3z;

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
    new-instance p1, Ll/lus;

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ll/lus;-><init>(Ll/qcj;)V

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

.method public F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mus;->e:Ll/nus;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nus;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 4
    .line 5
    return-object p0
.end method

.method public H2()Ll/nus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mus;->e:Ll/nus;

    .line 2
    .line 3
    return-object p0
.end method

.method public I2()V
    .locals 0

    .line 1
    return-void
.end method

.method public K2()Ll/u3z;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mus;->e:Ll/nus;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nus;->c:Ll/u3z;

    .line 4
    .line 5
    return-object p0
.end method

.method public L2(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public M2()V
    .locals 0

    .line 1
    return-void
.end method

.method public N2(Ll/hk2;)Ljava/lang/Object;
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
    invoke-virtual {p0}, Ll/mus;->K2()Ll/u3z;

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
    iget-object p0, p0, Ll/mus;->e:Ll/nus;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
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
