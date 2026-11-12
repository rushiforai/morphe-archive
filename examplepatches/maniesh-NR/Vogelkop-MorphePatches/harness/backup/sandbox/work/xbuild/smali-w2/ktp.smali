.class public final Lktp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr0k;


# instance fields
.field public final a:Larp;

.field public final b:Larp;

.field public final c:Larp;


# direct methods
.method public constructor <init>(Larp;Larp;Larp;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lktp;->a:Larp;

    iput-object p2, p0, Lktp;->b:Larp;

    iput-object p3, p0, Lktp;->c:Larp;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;
    .registers 2

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1}, Lr0k;->a(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final b(I)Lcom/google/android/gms/tasks/Task;
    .registers 2

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1}, Lr0k;->b(I)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final c()Lcom/google/android/gms/tasks/Task;
    .registers 1

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0}, Lr0k;->c()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final d(Lqop;Lgdb;I)Z
    .registers 4

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3}, Lr0k;->d(Lqop;Lgdb;I)Z

    move-result p0

    return p0
.end method

.method public final e(La9e;)V
    .registers 2

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1}, Lr0k;->e(La9e;)V

    return-void
.end method

.method public final f(La9e;)V
    .registers 2

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1}, Lr0k;->f(La9e;)V

    return-void
.end method

.method public final g(I)Lcom/google/android/gms/tasks/Task;
    .registers 2

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1}, Lr0k;->g(I)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final h()Ljava/util/Set;
    .registers 1

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0}, Lr0k;->h()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public final i(Ln9h;)Lcom/google/android/gms/tasks/Task;
    .registers 2

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1}, Lr0k;->i(Ln9h;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final j()Ljava/util/Set;
    .registers 1

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0}, Lr0k;->j()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public final k(Ljava/util/ArrayList;)Lcom/google/android/gms/tasks/Task;
    .registers 2

    invoke-virtual {p0}, Lktp;->l()Lr0k;

    move-result-object p0

    invoke-interface {p0, p1}, Lr0k;->k(Ljava/util/ArrayList;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final l()Lr0k;
    .registers 2

    iget-object v0, p0, Lktp;->c:Larp;

    invoke-virtual {v0}, Larp;->zza()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_11

    iget-object p0, p0, Lktp;->b:Larp;

    invoke-virtual {p0}, Larp;->zza()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lr0k;

    return-object p0

    :cond_11
    iget-object p0, p0, Lktp;->a:Larp;

    invoke-virtual {p0}, Larp;->zza()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lr0k;

    return-object p0
.end method
