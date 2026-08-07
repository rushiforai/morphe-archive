.class public Ll/xzs;
.super Ll/l6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        "V::",
        "Ll/iam;",
        ">",
        "Ll/l6t<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public e:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public final f:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ner;)V
    .locals 0

    .line 12
    invoke-direct {p0, p2}, Ll/l6t;-><init>(Ll/ner;)V

    .line 13
    iput-object p1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    return-void
.end method

.method public constructor <init>(Ll/dum;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p1, Ll/dum;->g:Ll/ner;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Ll/xzs;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ner;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/xzs;->P2(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public D2()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public E2()Ll/oo2;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    return-object p0
.end method

.method public F2()Lcom/tantan/live/eventbus/LiveEventBus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->l:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    return-object p0
.end method

.method public H2()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 4
    .line 5
    return-object p0
.end method

.method public I2()Ll/jsv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public K2()Ll/t8s;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->k:Ll/t8s;

    .line 4
    .line 5
    return-object p0
.end method

.method public L2()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/dum;->d:Z

    .line 4
    .line 5
    return p0
.end method

.method public M2()Ll/u3z;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->i:Ll/u3z;

    .line 4
    .line 5
    return-object p0
.end method

.method public N2()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->j:Ll/x6t;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x6t;->M3()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public P2(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    return-void
.end method

.method public Q2()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    return-object p0
.end method

.method public R2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->e:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method
