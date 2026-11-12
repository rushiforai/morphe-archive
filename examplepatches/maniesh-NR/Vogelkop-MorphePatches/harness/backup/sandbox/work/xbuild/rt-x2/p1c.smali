.class public final Lp1c;
.super Lt7j;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Lumi;

.field public final l:Lx5f;

.field public final m:Lcom/opera/android/settings/SettingsManager;

.field public final n:Lbqe;

.field public final o:Lhte;

.field private final p:Lq1c;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final q:Ljava/util/concurrent/atomic/AtomicReference;

.field public r:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;Lcom/opera/android/settings/SettingsManager;Lbqe;Lhte;Ltm5;)V
    .registers 8

    invoke-direct {p0, p7}, Lt7j;-><init>(Ltm5;)V

    new-instance p7, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p7}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p7, p0, Lp1c;->q:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lp1c;->j:Landroid/content/Context;

    iput-object p2, p0, Lp1c;->k:Lumi;

    iput-object p3, p0, Lp1c;->l:Lx5f;

    iput-object p4, p0, Lp1c;->m:Lcom/opera/android/settings/SettingsManager;

    iput-object p5, p0, Lp1c;->n:Lbqe;

    iput-object p6, p0, Lp1c;->o:Lhte;

    new-instance p2, Ldnb;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Ldnb;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Lvr9;

    const/4 p4, 0x3

    invoke-direct {p3, p2, p4}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    sget-object p2, Lcak;->d:Lavj;

    const/4 p2, 0x4

    invoke-static {p2, p3}, Lavj;->g(ILjava/lang/Runnable;)V

    new-instance p2, Lo1c;

    invoke-direct {p2, p0}, Lo1c;-><init>(Lp1c;)V

    invoke-static {p2}, Lac8;->c(Ljava/lang/Object;)V

    new-instance p2, Lm1c;

    const/4 p4, 0x0

    invoke-direct {p2, p0, p3, p4}, Lm1c;-><init>(Lp1c;Lvr9;B)V

    invoke-virtual {p5, p2}, Lno7;->g(Lmo7;)V

    new-instance p2, Lm1c;

    const/4 p4, 0x1

    invoke-direct {p2, p0, p3, p4}, Lm1c;-><init>(Lp1c;Lvr9;B)V

    invoke-virtual {p6, p2}, Lno7;->g(Lmo7;)V

    new-instance p2, Lq1c;

    invoke-direct {p2, p1, p0}, Lq1c;-><init>(Landroid/content/Context;Lp1c;)V

    invoke-virtual {p2}, Lq1c;->e()Ll0c;

    move-result-object p1

    if-nez p1, :cond_57

    invoke-virtual {p2}, Lq1c;->d()Ll0c;

    move-result-object p1

    if-eqz p1, :cond_5a

    :cond_57
    invoke-virtual {p0, p2}, Lt7j;->b(Lq8j;)V

    :cond_5a
    iput-object p2, p0, Lp1c;->p:Lq1c;

    return-void
.end method

.method public static e(Lbqe;Lhte;)Ln1c;
    .registers 5

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lite;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcqe;

    new-instance v0, Ln1c;

    new-instance v1, Ljava/util/LinkedHashSet;

    iget-object v2, p1, Lite;->a:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    iget-object v2, p0, Lcqe;->a:Ll0c;

    iget-boolean p1, p1, Lite;->b:Z

    if-nez p1, :cond_21

    iget-boolean p0, p0, Lcqe;->b:Z

    if-nez p0, :cond_21

    const/4 p0, 0x0

    goto :goto_22

    :cond_21
    const/4 p0, 0x1

    :goto_22
    invoke-direct {v0, v1, v2, p0}, Ln1c;-><init>(Ljava/util/LinkedHashSet;Ll0c;Z)V

    return-object v0
.end method


# virtual methods
.method public final a(Lisd;)Lk7j;
    .registers 5

    new-instance v0, Lne5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p0, Lp1c;->l:Lx5f;

    iput-object v1, v0, Lne5;->a:Ljava/lang/Object;

    iget-object v1, p0, Lp1c;->m:Lcom/opera/android/settings/SettingsManager;

    iput-object v1, v0, Lne5;->b:Ljava/lang/Object;

    iget-object v1, p0, Lp1c;->n:Lbqe;

    iput-object v1, v0, Lne5;->c:Ljava/lang/Object;

    iget-object v1, p0, Lp1c;->o:Lhte;

    iput-object v1, v0, Lne5;->d:Ljava/lang/Object;

    new-instance v1, Ln0c;

    iget-object v2, p0, Lp1c;->j:Landroid/content/Context;

    invoke-direct {v1, v2}, Ln0c;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lne5;->e:Ljava/lang/Object;

    iget-object v1, p0, Lp1c;->q:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object v1, v0, Lne5;->f:Ljava/lang/Object;

    iget-object p0, p0, Lp1c;->k:Lumi;

    invoke-virtual {p0, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v1, Lyzb;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Lyzb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    iput-object p0, v0, Lne5;->g:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-object v0
.end method

.method public final f()V
    .registers 3

    iget-boolean v0, p0, Lp1c;->r:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lp1c;->n:Lbqe;

    iget-object v1, p0, Lp1c;->o:Lhte;

    invoke-static {v0, v1}, Lp1c;->e(Lbqe;Lhte;)Ln1c;

    move-result-object v0

    iget-object v1, p0, Lp1c;->q:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln1c;

    if-eqz v1, :cond_1d

    invoke-virtual {v1, v0}, Ln1c;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    invoke-virtual {p0}, Lt7j;->c()V

    return-void
.end method

.method public final g(Ll0c;)V
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lp1c;->j:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Ll0c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p1, Ll0c;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "recommendations_language_region"

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
