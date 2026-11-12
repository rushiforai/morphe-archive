.class public abstract Lmom;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Z

.field public static final b:Lgom;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lgom;

    sget-object v1, Llom;->a:Llom;

    sget-object v2, Lkom;->a:Lkom;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lgom;-><init>(Llom;Lkom;Ljava/lang/Integer;)V

    sput-object v0, Lmom;->b:Lgom;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lgom;
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->r()Lg89;

    move-result-object v0

    iget-object v1, v0, Lg89;->k:Ljava/lang/Object;

    monitor-enter v1

    :try_start_13
    iget-boolean v2, v0, Lg89;->l:Z
    :try_end_15
    .catchall {:try_start_13 .. :try_end_15} :catchall_9d

    monitor-exit v1

    const/4 v1, 0x1

    if-eqz v2, :cond_66

    iget-object v2, v0, Lg89;->k:Ljava/lang/Object;

    monitor-enter v2

    :try_start_1c
    iget-object v3, v0, Lg89;->m:Lf89;
    :try_end_1e
    .catchall {:try_start_1c .. :try_end_1e} :catchall_63

    monitor-exit v2

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_50

    if-eq v2, v1, :cond_3d

    const/4 v3, 0x2

    if-ne v2, v3, :cond_66

    new-instance p0, Lgom;

    sget-object v1, Llom;->d:Llom;

    sget-object v2, Lkom;->b:Lkom;

    iget-object v3, v0, Lg89;->k:Ljava/lang/Object;

    monitor-enter v3

    :try_start_33
    iget-object v0, v0, Lg89;->n:Ljava/lang/Integer;
    :try_end_35
    .catchall {:try_start_33 .. :try_end_35} :catchall_3a

    monitor-exit v3

    invoke-direct {p0, v1, v2, v0}, Lgom;-><init>(Llom;Lkom;Ljava/lang/Integer;)V

    return-object p0

    :catchall_3a
    move-exception p0

    monitor-exit v3

    throw p0

    :cond_3d
    new-instance p0, Lgom;

    sget-object v1, Llom;->c:Llom;

    sget-object v2, Lkom;->b:Lkom;

    iget-object v3, v0, Lg89;->k:Ljava/lang/Object;

    monitor-enter v3

    :try_start_46
    iget-object v0, v0, Lg89;->n:Ljava/lang/Integer;
    :try_end_48
    .catchall {:try_start_46 .. :try_end_48} :catchall_4d

    monitor-exit v3

    invoke-direct {p0, v1, v2, v0}, Lgom;-><init>(Llom;Lkom;Ljava/lang/Integer;)V

    return-object p0

    :catchall_4d
    move-exception p0

    monitor-exit v3

    throw p0

    :cond_50
    new-instance p0, Lgom;

    sget-object v1, Llom;->b:Llom;

    sget-object v2, Lkom;->b:Lkom;

    iget-object v3, v0, Lg89;->k:Ljava/lang/Object;

    monitor-enter v3

    :try_start_59
    iget-object v0, v0, Lg89;->n:Ljava/lang/Integer;
    :try_end_5b
    .catchall {:try_start_59 .. :try_end_5b} :catchall_60

    monitor-exit v3

    invoke-direct {p0, v1, v2, v0}, Lgom;-><init>(Llom;Lkom;Ljava/lang/Integer;)V

    return-object p0

    :catchall_60
    move-exception p0

    monitor-exit v3

    throw p0

    :catchall_63
    move-exception p0

    monitor-exit v2

    throw p0

    :cond_66
    sget-boolean v0, Lmom;->a:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_75

    new-instance p0, Lgom;

    sget-object v0, Llom;->b:Llom;

    sget-object v1, Lkom;->a:Lkom;

    invoke-direct {p0, v0, v1, v2}, Lgom;-><init>(Llom;Lkom;Ljava/lang/Integer;)V

    return-object p0

    :cond_75
    invoke-static {p0}, Lhom;->t(Landroid/content/Context;)Lhom;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfom;

    iget v0, v0, Lfom;->a:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_9a

    const-string v0, "com.android.vending"

    invoke-static {p0}, Lr9n;->l(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9a

    new-instance p0, Lgom;

    sget-object v0, Llom;->b:Llom;

    sget-object v1, Lkom;->a:Lkom;

    invoke-direct {p0, v0, v1, v2}, Lgom;-><init>(Llom;Lkom;Ljava/lang/Integer;)V

    return-object p0

    :cond_9a
    sget-object p0, Lmom;->b:Lgom;

    return-object p0

    :catchall_9d
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public static b(Lt5d;Lgom;)V
    .registers 13

    iget-object v0, p1, Lgom;->a:Llom;

    iget-object p1, p1, Lgom;->b:Lkom;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_8e

    const/4 v2, 0x3

    if-ne v0, v2, :cond_96

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-ne p1, v1, :cond_96

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->r()Lg89;

    move-result-object p0

    iget-object p1, p0, Lg89;->d:Lrsp;

    iget-object v1, p1, Lrsp;->a:Ljup;

    iget-object p1, p1, Lrsp;->c:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    iget-object v6, v1, Ljup;->a:Lbvp;

    if-nez v6, :cond_58

    sget-object p1, Ljup;->e:Lr40;

    const/16 v0, -0x9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "PlayCore"

    const/4 v3, 0x6

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_4b

    iget-object p1, p1, Lr40;->b:Ljava/lang/String;

    const-string v2, "onError(%d)"

    invoke-static {p1, v2, v1}, Lr40;->g(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_4e

    :cond_4b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_4e
    new-instance p1, Lgab;

    invoke-direct {p1, v0}, Lgab;-><init>(I)V

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    goto :goto_83

    :cond_58
    sget-object p1, Ljup;->e:Lr40;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "completeUpdate(%s)"

    invoke-virtual {p1, v2, v0}, Lr40;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v2}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    new-instance v0, Lrtp;

    const/4 v5, 0x1

    move-object v3, v2

    invoke-direct/range {v0 .. v5}, Lrtp;-><init>(Ljava/lang/Object;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/TaskCompletionSource;Ljava/lang/Object;B)V

    new-instance v5, Lrtp;

    const/4 v10, 0x2

    move-object v8, v2

    move-object v9, v0

    move-object v7, v2

    invoke-direct/range {v5 .. v10}, Lrtp;-><init>(Ljava/lang/Object;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/TaskCompletionSource;Ljava/lang/Object;B)V

    invoke-virtual {v6}, Lbvp;->a()Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    :goto_83
    new-instance v0, Lbm8;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :cond_8e
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_a7

    if-eq p1, v1, :cond_97

    :cond_96
    return-void

    :cond_97
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->r()Lg89;

    move-result-object p1

    invoke-virtual {p1, p0, v1}, Lg89;->b(Lt5d;Z)V

    return-void

    :cond_a7
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0}, Luup;->y(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method
