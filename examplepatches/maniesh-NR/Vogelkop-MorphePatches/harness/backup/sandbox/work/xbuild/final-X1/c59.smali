.class public abstract Lc59;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:Ljava/util/concurrent/ExecutorService;

.field public static final m:Lode;


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Lm59;

.field public final c:Lj59;

.field public d:Z

.field public e:Z

.field public f:Ljava/util/HashSet;

.field public final g:Lb59;

.field public final h:Lb59;

.field public final i:Lh7f;

.field public j:Ljava/lang/Boolean;

.field public final k:Lt77;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Llhe;

    const-string v1, "Opera FCM"

    invoke-direct {v0, v1}, Llhe;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lc59;->l:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lode;

    sget-object v1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lc59;->m:Lode;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lj59;)V
    .registers 6

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "fcm_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    iget-object v1, p3, Lj59;->e:Ljava/lang/String;

    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lc59;-><init>(Landroid/content/Context;Lumi;Lj59;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lj59;Ljava/lang/String;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lc59;->e:Z

    new-instance v1, Lh7f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lc59;->i:Lh7f;

    new-instance v1, Lt77;

    invoke-direct {v1, p0, v0}, Lt77;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lc59;->k:Lt77;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lc59;->a:Landroid/content/Context;

    new-instance v1, Ldg7;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Ldg7;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lvml;->a:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Ldz8;

    invoke-direct {v2, v1, v0}, Ldz8;-><init>(Lcom/opera/api/Callback;B)V

    new-array v0, v0, [Lbg1;

    const/4 v1, 0x0

    aput-object v2, v0, v1

    invoke-static {p1, p2, p4, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p2

    iput-object p2, p0, Lc59;->g:Lb59;

    iput-object p3, p0, Lc59;->c:Lj59;

    new-instance p2, Lb59;

    invoke-direct {p2, p0, p1}, Lb59;-><init>(Lc59;Landroid/content/Context;)V

    iput-object p2, p0, Lc59;->h:Lb59;

    new-instance p0, Lbn7;

    const/16 p1, 0x1a

    invoke-direct {p0, p2, p1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    sget-object p1, Lc59;->l:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(Lm59;)V
    .registers 8

    iget-boolean v0, p0, Lc59;->d:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x2

    goto :goto_7

    :cond_6
    const/4 v0, 0x3

    :goto_7
    invoke-virtual {p1, v0}, Lm59;->m(I)V

    iget-boolean p1, p0, Lc59;->d:Z

    iget-object v0, p0, Lc59;->k:Lt77;

    if-nez p1, :cond_68

    invoke-virtual {p0}, Lc59;->d()Lekc;

    move-result-object p1

    invoke-virtual {p1, v0}, Lekc;->p(Lf7f;)V

    iget-object p1, p0, Lc59;->h:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lr49;->f(Ljava/lang/String;)Lr49;

    move-result-object p1

    const-class v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {p1, v0}, Lr49;->b(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {p0}, Lc59;->c()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_35
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/google/firebase/messaging/FirebaseMessaging;->i:Lcom/google/android/gms/tasks/Task;

    new-instance v4, Ljp5;

    const/4 v5, 0x5

    invoke-direct {v4, v2, v5}, Ljp5;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v3, v4}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    goto :goto_35

    :cond_4d
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result p1

    if-lez p1, :cond_64

    invoke-virtual {p0}, Lc59;->b()Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "subscribed_topics"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_64
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    return-void

    :cond_68
    invoke-virtual {p0}, Lc59;->d()Lekc;

    move-result-object p0

    invoke-virtual {p0, v0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final b()Landroid/content/SharedPreferences;
    .registers 1

    iget-object p0, p0, Lc59;->g:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    return-object p0
.end method

.method public final c()Ljava/util/Set;
    .registers 3

    iget-object v0, p0, Lc59;->f:Ljava/util/HashSet;

    if-nez v0, :cond_10

    invoke-virtual {p0}, Lc59;->b()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "subscribed_topics"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    iput-object v0, p0, Lc59;->f:Ljava/util/HashSet;

    :cond_10
    return-object v0
.end method

.method public d()Lekc;
    .registers 1

    sget-object p0, Lc59;->m:Lode;

    return-object p0
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 4

    iget-object p0, p0, Lc59;->i:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lq3i;

    invoke-virtual {p1, p2}, Lq3i;->a(Ljava/lang/String;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final f(Z)V
    .registers 3

    iget-object v0, p0, Lc59;->b:Lm59;

    if-eqz v0, :cond_d

    if-eqz p1, :cond_8

    const/4 p0, 0x5

    goto :goto_9

    :cond_8
    const/4 p0, 0x4

    :goto_9
    invoke-virtual {v0, p0}, Lm59;->m(I)V

    return-void

    :cond_d
    iget-object v0, p0, Lc59;->j:Ljava/lang/Boolean;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_18

    return-void

    :cond_18
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lc59;->j:Ljava/lang/Boolean;

    return-void
.end method
