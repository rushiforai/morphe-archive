.class public abstract Lpxo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lr22;

.field public c:Luuj;

.field public volatile d:Lvoo;

.field public volatile e:Lbap;

.field public f:Landroid/view/ViewGroup;

.field public g:Lsxo;

.field public h:Lne5;

.field public i:Lp7p;

.field public final j:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lr22;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpxo;->a:Landroid/content/Context;

    iput-object p2, p0, Lpxo;->b:Lr22;

    new-instance v0, Ls9p;

    const/4 v5, 0x0

    const/16 v1, 0x1f

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lbap;-><init>(IZZZZ)V

    iput-object v0, p0, Lpxo;->e:Lbap;

    sget-object p1, Lxvo;->j:Lxvo;

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lpxo;->j:Lzyk;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 6

    const/4 v0, 0x0

    iput-object v0, p0, Lpxo;->c:Luuj;

    iget-object v1, p0, Lpxo;->d:Lvoo;

    if-eqz v1, :cond_1a

    iget-object v1, v1, Lvoo;->x:Ljava/io/File;

    if-nez v1, :cond_c

    move-object v1, v0

    :cond_c
    if-eqz v1, :cond_1a

    sget-object v2, Lw2p;->b:La64;

    new-instance v3, Lhmo;

    const/4 v4, 0x6

    invoke-direct {v3, v4, v0, v1}, Lhmo;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v1, 0x3

    invoke-static {v2, v0, v0, v3, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_1a
    iget-object v1, p0, Lpxo;->h:Lne5;

    if-eqz v1, :cond_21

    invoke-virtual {v1}, Lne5;->o()V

    :cond_21
    iput-object v0, p0, Lpxo;->h:Lne5;

    return-void
.end method

.method public abstract b(Lvoo;)V
.end method

.method public final c()V
    .registers 5

    iget-object v0, p0, Lpxo;->e:Lbap;

    instance-of v0, v0, Ls9p;

    const/4 v1, 0x1

    if-nez v0, :cond_22

    iget-object v0, p0, Lpxo;->b:Lr22;

    iget-object v0, v0, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Lvdp;

    const/16 v2, 0x68

    invoke-virtual {v0, v2}, Lvdp;->h(I)V

    iget-object p0, p0, Lpxo;->c:Luuj;

    if-eqz p0, :cond_21

    new-instance v0, Lcm;

    const/4 v2, 0x0

    const-string v3, "Repetitive load on one Ad!"

    invoke-direct {v0, v1, v3, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {p0, v0}, Luuj;->g(Lcm;)V

    :cond_21
    return-void

    :cond_22
    iget-object v0, p0, Lpxo;->b:Lr22;

    iget-object v0, v0, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Lvdp;

    iget-object v0, v0, Lejo;->a:Ljava/lang/Object;

    check-cast v0, Lw9p;

    invoke-virtual {v0}, Lw9p;->C()V

    iget-object v0, p0, Lpxo;->e:Lbap;

    invoke-virtual {v0}, Lbap;->h()Lbap;

    move-result-object v0

    iput-object v0, p0, Lpxo;->e:Lbap;

    iget-object v0, p0, Lpxo;->b:Lr22;

    new-instance v2, Livo;

    invoke-direct {v2, v1, p0}, Livo;-><init>(ZLpxo;)V

    new-instance p0, Lfmn;

    const/16 v1, 0x8

    invoke-direct {p0, v0, v2, v1}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lttn;

    const/16 v1, 0x9

    invoke-direct {v0, v2, v1}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v0}, Lcbp;->c(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d()Z
    .registers 3

    iget-object v0, p0, Lpxo;->d:Lvoo;

    const/4 v1, 0x1

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lvoo;->a()Z

    move-result v0

    if-eq v0, v1, :cond_19

    :cond_b
    iget-object v0, p0, Lpxo;->e:Lbap;

    instance-of v0, v0, Lj9p;

    if-nez v0, :cond_19

    iget-object p0, p0, Lpxo;->e:Lbap;

    instance-of p0, p0, Ln9p;

    if-nez p0, :cond_19

    const/4 p0, 0x0

    return p0

    :cond_19
    return v1
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lpxo;->h:Lne5;

    if-nez v0, :cond_d

    new-instance v0, Lne5;

    iget-object v1, p0, Lpxo;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Lne5;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lpxo;->h:Lne5;

    :cond_d
    iget-object v1, p0, Lpxo;->f:Landroid/view/ViewGroup;

    new-instance v2, Lcwo;

    invoke-direct {v2, p0}, Lcwo;-><init>(Lpxo;)V

    invoke-virtual {v0, v1, v2}, Lne5;->m(Landroid/view/View;Lhko;)V

    return-void
.end method
