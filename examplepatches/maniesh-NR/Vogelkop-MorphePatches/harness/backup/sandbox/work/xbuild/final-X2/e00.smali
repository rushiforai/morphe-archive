.class public final Le00;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lb59;

.field public final d:Ljava/util/concurrent/atomic/AtomicReference;

.field public e:Lc00;

.field public final f:Lnrl;

.field public g:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Le00;->d:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Le00;->f:Lnrl;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Le00;->a:Landroid/content/Context;

    iput-object p2, p0, Le00;->b:Lumi;

    new-instance v0, La00;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, La00;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x1

    new-array v2, v2, [Lbg1;

    aput-object v0, v2, v1

    const-string v0, "advertising_pref_store"

    invoke-static {p1, p2, v0, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Le00;->c:Lb59;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Le00;->e:Lc00;

    if-eqz v0, :cond_a

    iget-object p0, v0, Lc00;->a:Ljava/lang/String;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_a
    iget-object v0, p0, Le00;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc00;

    iget-boolean v1, v0, Lc00;->c:Z

    if-eqz v1, :cond_26

    iget-object v1, p0, Le00;->f:Lnrl;

    iget-boolean v2, v1, Lnrl;->a:Z

    if-nez v2, :cond_26

    new-instance v0, Lxa;

    const/4 v2, 0x7

    invoke-direct {v0, p0, p1, v2}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void

    :cond_26
    iget-object p0, v0, Lc00;->a:Ljava/lang/String;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final b()Lc00;
    .registers 2

    iget-object v0, p0, Le00;->e:Lc00;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    iget-object p0, p0, Le00;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc00;

    return-object p0
.end method

.method public final c()V
    .registers 6

    iget-object v0, p0, Le00;->g:Ljava/util/ArrayList;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Le00;->g:Ljava/util/ArrayList;

    iget-object v2, p0, Le00;->f:Lnrl;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lmni;

    const/16 v4, 0xa

    invoke-direct {v3, v2, v4}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ld00;

    new-instance v2, Lab;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-object v3, p0, Le00;->a:Landroid/content/Context;

    invoke-direct {v0, v3, v2}, Ld00;-><init>(Landroid/content/Context;Lab;)V

    new-instance v2, Lva2;

    invoke-direct {v2, v0, v1}, Lva2;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lab;

    const/16 v4, 0x13

    invoke-direct {v3, v0, v4}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Le00;->b:Lumi;

    invoke-virtual {p0, v2}, Lumi;->g(Ln5o;)Lnml;

    move-result-object v0

    new-instance v2, Llw0;

    invoke-direct {v2, v3, v1}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
