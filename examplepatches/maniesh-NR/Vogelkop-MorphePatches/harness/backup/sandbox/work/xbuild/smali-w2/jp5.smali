.class public final synthetic Ljp5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li6f;
.implements Lmr8;
.implements Lcom/google/android/gms/tasks/SuccessContinuation;
.implements Lcom/google/android/gms/tasks/Continuation;
.implements Lv0k;
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Ljp5;->a:B

    iput-object p2, p0, Ljp5;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    .line 8
    iput-byte p2, p0, Ljp5;->a:B

    iput-object p1, p0, Ljp5;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(Lhq8;)Z
    .registers 4

    iget-byte v0, p0, Ljp5;->a:B

    iget-object p0, p0, Ljp5;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_38

    invoke-virtual {p1}, Lhq8;->c()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_10
    invoke-virtual {p1}, Lhq8;->j()Z

    move-result v0

    if-nez v0, :cond_36

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x19

    if-gt v0, v1, :cond_36

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_36

    const/4 p0, 0x1

    goto :goto_37

    :cond_36
    const/4 p0, 0x0

    :goto_37
    return p0

    :pswitch_data_38
    .packed-switch 0x3
        :pswitch_10
    .end packed-switch
.end method

.method public final e()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ljp5;->a:B

    iget-object p0, p0, Ljp5;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_1a

    new-instance v0, Larb;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_d
    new-instance v0, Larb;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_13
    new-instance v0, Larb;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final f(Lvr3;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .registers 5

    new-instance v0, Ls0k;

    const/4 v1, 0x1

    iget-object p0, p0, Ljp5;->b:Ljava/lang/String;

    invoke-direct {v0, p1, p2, p0, v1}, Ls0k;-><init>(Lvr3;Ljava/lang/CharSequence;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    sget-object p1, Lxne;->b:Lii;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lt9f;

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    iget-object p0, p0, Ljp5;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lfvh;->h(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    new-instance p1, Lioj;

    const/16 v0, 0x9

    invoke-direct {p1, v0}, Lioj;-><init>(B)V

    invoke-interface {p0, p1}, Lv84;->enqueue(Lf94;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .registers 4

    iget-byte v0, p0, Ljp5;->a:B

    iget-object p0, p0, Ljp5;->b:Ljava/lang/String;

    check-cast p1, Lgwl;

    packed-switch v0, :pswitch_data_2e

    .line 86
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    new-instance v0, Lawl;

    const-string v1, "U"

    invoke-direct {v0, v1, p0}, Lawl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-virtual {p1, v0}, Lgwl;->a(Lawl;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    .line 89
    invoke-virtual {p1}, Lgwl;->c()V

    return-object p0

    .line 90
    :pswitch_1b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    new-instance v0, Lawl;

    const-string v1, "S"

    invoke-direct {v0, v1, p0}, Lawl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-virtual {p1, v0}, Lgwl;->a(Lawl;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    .line 93
    invoke-virtual {p1}, Lgwl;->c()V

    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x4
        :pswitch_1b
    .end packed-switch
.end method

.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ljp5;->a:B

    iget-object p0, p0, Ljp5;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_56

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-static {p1}, Lx79;->F(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Exception;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    goto :goto_25

    :cond_16
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    new-instance v0, Landroid/util/Pair;

    invoke-direct {v0, p1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    :goto_25
    return-object p0

    :pswitch_26
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_4c

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3f

    invoke-virtual {p1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3f

    return-object p0

    :cond_3f
    new-instance p0, Ljava/util/concurrent/ExecutionException;

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unexpected Error: FID NOT matching!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p0

    :cond_4c
    new-instance p0, Ljava/util/concurrent/ExecutionException;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p0

    :pswitch_data_56
    .packed-switch 0x6
        :pswitch_26
    .end packed-switch
.end method
