.class public final Laco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgfn;
.implements Lidc;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lz4k;

.field public final c:Lzv9;

.field public final d:Ljg8;

.field public e:Lgfn;

.field public f:I

.field public g:Lzbo;

.field public h:B

.field public i:Z

.field public j:Ltcc;

.field public final synthetic k:Lw7j;


# direct methods
.method public constructor <init>(Lw7j;Landroid/content/Context;Lz4k;Lzv9;Ljg8;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laco;->k:Lw7j;

    iput-object p2, p0, Laco;->a:Landroid/content/Context;

    iput-object p3, p0, Laco;->b:Lz4k;

    iput-object p4, p0, Laco;->c:Lzv9;

    iput-object p5, p0, Laco;->d:Ljg8;

    return-void
.end method


# virtual methods
.method public final E(Lndc;Locc;)V
    .registers 3

    sget-object p1, Locc;->ON_DESTROY:Locc;

    if-ne p2, p1, :cond_9

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Laco;->o(Ltcc;)V

    return-void

    :cond_9
    sget-object p1, Locc;->ON_RESUME:Locc;

    if-ne p2, p1, :cond_15

    iget-byte p1, p0, Laco;->h:B

    const/4 p2, 0x1

    if-ne p1, p2, :cond_15

    invoke-virtual {p0}, Laco;->n()V

    :cond_15
    return-void
.end method

.method public final a(JLjava/lang/String;Ljava/lang/String;)Lgfn;
    .registers 6

    iget-object v0, p0, Laco;->e:Lgfn;

    if-eqz v0, :cond_8

    invoke-interface {v0, p1, p2, p3, p4}, Lgfn;->a(JLjava/lang/String;Ljava/lang/String;)Lgfn;

    return-object p0

    :cond_8
    new-instance v0, Lzbo;

    invoke-direct {v0, p3, p4, p1, p2}, Lzbo;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    iput-object v0, p0, Laco;->g:Lzbo;

    return-object p0
.end method

.method public final b(Lbnk;Ljava/lang/String;)Lgfn;
    .registers 4

    iget-object v0, p0, Laco;->e:Lgfn;

    if-eqz v0, :cond_7

    invoke-interface {v0, p1, p2}, Lgfn;->b(Lbnk;Ljava/lang/String;)Lgfn;

    :cond_7
    return-object p0
.end method

.method public final c(I)Lgfn;
    .registers 3

    iget-object v0, p0, Laco;->e:Lgfn;

    if-eqz v0, :cond_a

    iget p1, p0, Laco;->f:I

    invoke-interface {v0, p1}, Lgfn;->c(I)Lgfn;

    return-object p0

    :cond_a
    iput p1, p0, Laco;->f:I

    return-object p0
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Laco;->e:Lgfn;

    if-eqz p0, :cond_7

    invoke-interface {p0}, Lgfn;->d()V

    :cond_7
    return-void
.end method

.method public final e()Lefn;
    .registers 1

    iget-object p0, p0, Laco;->e:Lgfn;

    if-eqz p0, :cond_9

    invoke-interface {p0}, Lgfn;->e()Lefn;

    move-result-object p0

    return-object p0

    :cond_9
    const/4 p0, 0x0

    return-object p0
.end method

.method public final f(Ljava/util/List;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Laco;->e:Lgfn;

    if-eqz p0, :cond_9

    invoke-interface {p0, p1}, Lgfn;->f(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9
    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Lcom/opera/api/Callback;)V
    .registers 2

    iget-object p0, p0, Laco;->e:Lgfn;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_9
    invoke-interface {p0, p1}, Lgfn;->g(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final getProtocol()I
    .registers 2

    iget-object v0, p0, Laco;->e:Lgfn;

    if-eqz v0, :cond_9

    invoke-interface {v0}, Lgfn;->getProtocol()I

    move-result p0

    return p0

    :cond_9
    iget p0, p0, Laco;->f:I

    return p0
.end method

.method public final h(Ljava/util/List;)Landroid/util/Pair;
    .registers 2

    iget-object p0, p0, Laco;->e:Lgfn;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    invoke-interface {p0, p1}, Lgfn;->h(Ljava/util/List;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public final i()V
    .registers 1

    iget-object p0, p0, Laco;->e:Lgfn;

    if-eqz p0, :cond_7

    invoke-interface {p0}, Lgfn;->i()V

    :cond_7
    return-void
.end method

.method public final isEnabled()Z
    .registers 3

    iget-object p0, p0, Laco;->e:Lgfn;

    const/4 v0, 0x0

    if-eqz p0, :cond_d

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_d

    return v1

    :cond_d
    return v0
.end method

.method public final j()Z
    .registers 3

    iget-object p0, p0, Laco;->e:Lgfn;

    const/4 v0, 0x0

    if-eqz p0, :cond_d

    invoke-interface {p0}, Lgfn;->j()Z

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_d

    return v1

    :cond_d
    return v0
.end method

.method public final k()Ljava/util/Map;
    .registers 1

    iget-object p0, p0, Laco;->e:Lgfn;

    if-eqz p0, :cond_9

    invoke-interface {p0}, Lgfn;->k()Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_9
    const/4 p0, 0x0

    return-object p0
.end method

.method public final l()Z
    .registers 2

    iget-object v0, p0, Laco;->e:Lgfn;

    if-eqz v0, :cond_9

    invoke-interface {v0}, Lgfn;->l()Z

    move-result p0

    return p0

    :cond_9
    iget-object p0, p0, Laco;->g:Lzbo;

    if-eqz p0, :cond_f

    const/4 p0, 0x1

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public final m(Ljava/lang/Integer;Z)V
    .registers 5

    const/4 v0, 0x0

    if-eqz p2, :cond_a

    const/4 p1, 0x3

    iput-byte p1, p0, Laco;->h:B

    invoke-virtual {p0, v0}, Laco;->o(Ltcc;)V

    return-void

    :cond_a
    if-eqz p1, :cond_13

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/4 v1, -0x5

    if-eq p2, v1, :cond_29

    :cond_13
    if-eqz p1, :cond_1d

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/16 v1, -0xe

    if-eq p2, v1, :cond_29

    :cond_1d
    if-eqz p1, :cond_27

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 p2, -0xf

    if-eq p1, p2, :cond_29

    :cond_27
    const/4 p1, 0x1

    goto :goto_2d

    :cond_29
    invoke-virtual {p0, v0}, Laco;->o(Ltcc;)V

    const/4 p1, 0x4

    :goto_2d
    iput-byte p1, p0, Laco;->h:B

    return-void
.end method

.method public final n()V
    .registers 6

    iget-byte v0, p0, Laco;->h:B

    const/4 v1, 0x2

    if-lt v0, v1, :cond_6

    return-void

    :cond_6
    iget-object v0, p0, Laco;->j:Ltcc;

    if-eqz v0, :cond_f

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    sget-object v2, Lqcc;->e:Lqcc;

    if-eq v0, v2, :cond_18

    const/4 v0, 0x1

    iput-byte v0, p0, Laco;->h:B

    return-void

    :cond_18
    iput-byte v1, p0, Laco;->h:B

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Laco;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object v0

    new-instance v1, Lwci;

    invoke-direct {v1}, Lwci;-><init>()V

    iget-object v2, v1, Lwci;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    const-string v3, "nord_vpn"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Ln9h;

    invoke-direct {v2, v1}, Ln9h;-><init>(Lwci;)V

    invoke-interface {v0, v2}, Lr0k;->i(Ln9h;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lvdi;

    const/16 v3, 0x10

    iget-object v4, p0, Laco;->k:Lw7j;

    invoke-direct {v2, p0, v0, v4, v3}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lr2n;

    const/16 v2, 0x1a

    invoke-direct {v1, p0, v2}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public final o(Ltcc;)V
    .registers 3

    iget-object v0, p0, Laco;->j:Ltcc;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    :cond_7
    iput-object p1, p0, Laco;->j:Ltcc;

    if-eqz p1, :cond_e

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    :cond_e
    return-void
.end method

.method public final p(Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Lifn;

    sget-object v1, Lhfn;->d:Lhfn;

    const/4 v2, 0x1

    invoke-direct {v0, v1, p1, v2}, Lifn;-><init>(Lhfn;Ljava/lang/Throwable;Z)V

    const/4 p1, 0x0

    iget-object p0, p0, Laco;->b:Lz4k;

    invoke-virtual {p0, v0, p1}, Lz4k;->g(Lifn;Z)V

    return-void
.end method

.method public final setEnabled(Z)Lgfn;
    .registers 3

    iget-object v0, p0, Laco;->e:Lgfn;

    if-eqz v0, :cond_8

    invoke-interface {v0, p1}, Lgfn;->setEnabled(Z)Lgfn;

    return-object p0

    :cond_8
    iput-boolean p1, p0, Laco;->i:Z

    if-eqz p1, :cond_f

    invoke-virtual {p0}, Laco;->n()V

    :cond_f
    return-object p0
.end method
