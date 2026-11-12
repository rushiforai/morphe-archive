.class public final Lcom/opera/android/browser/obml/MiniHttpClient$Call;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:Lpp6;

.field public final synthetic c:Lhzd;


# direct methods
.method public constructor <init>(Lhzd;Lg77;Lpp6;)V
    .registers 9

    iget-object v0, p2, Lg77;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->c:Lhzd;

    iput-object p3, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->b:Lpp6;

    :try_start_b
    invoke-static {p0}, LJ/N;->MDswzPDG(Ljava/lang/Object;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a:J

    const-wide/16 v3, 0x0

    cmp-long p3, v1, v3

    if-eqz p3, :cond_93

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_60

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s: %s\n"

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    filled-new-array {v4, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2a

    :cond_4e
    iget-wide v0, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a:J

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, v1, p3}, LJ/N;->MPmHh3_b(JLjava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_60

    new-instance p1, Ljava/lang/OutOfMemoryError;

    invoke-direct {p1}, Ljava/lang/OutOfMemoryError;-><init>()V

    throw p1

    :cond_60
    iget-object p3, p2, Lg77;->c:Ljava/lang/Object;

    check-cast p3, Ljava/lang/String;

    if-eqz p3, :cond_74

    iget-wide v0, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a:J

    invoke-static {v0, v1, p3}, LJ/N;->MIfPGjX4(JLjava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_74

    new-instance p1, Ljava/lang/OutOfMemoryError;

    invoke-direct {p1}, Ljava/lang/OutOfMemoryError;-><init>()V

    throw p1

    :cond_74
    iget-wide v0, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a:J

    iget-object p2, p2, Lg77;->a:Ljava/lang/Object;

    check-cast p2, Ljava/net/URI;

    invoke-virtual {p2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    invoke-static {v0, v1, p2, p3}, LJ/N;->MnYtdHus(JLjava/lang/Object;Z)Z

    move-result p2
    :try_end_83
    .catchall {:try_start_b .. :try_end_83} :catchall_99

    if-eqz p2, :cond_8b

    iget-object p1, p1, Lhzd;->a:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_8b
    :try_start_8b
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Failed to start request."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_93
    new-instance p1, Ljava/lang/OutOfMemoryError;

    invoke-direct {p1}, Ljava/lang/OutOfMemoryError;-><init>()V

    throw p1
    :try_end_99
    .catchall {:try_start_8b .. :try_end_99} :catchall_99

    :catchall_99
    move-exception p1

    invoke-virtual {p0}, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a()V

    throw p1
.end method


# virtual methods
.method public final a()V
    .registers 6

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->b:Lpp6;

    iget-wide v0, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_c

    return-void

    :cond_c
    invoke-static {v0, v1}, LJ/N;->M_RORtJH(J)V

    iput-wide v2, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a:J

    sget-object v0, Lhzd;->b:Lhzd;

    iget-object v0, p0, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->c:Lhzd;

    iget-object v0, v0, Lhzd;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onCallBack(Z[B)V
    .registers 5
    .param p2    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcda;

    invoke-direct {v1, p0, p1, p2}, Lcda;-><init>(Lcom/opera/android/browser/obml/MiniHttpClient$Call;Z[B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
