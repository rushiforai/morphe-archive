.class public final Lcom/opera/android/notifications/channels/ChannelsUpdateWorker;
.super Landroidx/work/Worker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/opera/android/notifications/channels/ChannelsUpdateWorker;",
        "Landroidx/work/Worker;",
        "Landroid/content/Context;",
        "context",
        "Landroidx/work/WorkerParameters;",
        "workerParams",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/WorkerParameters;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroidx/work/Worker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    return-void
.end method

.method public static final d(Landroid/content/Context;)V
    .registers 4

    sget-object v0, Lxs4;->a:Lc5o;

    iget-object v0, v0, Lc5o;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "channels_version_key"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/16 v1, 0x12

    if-eq v0, v1, :cond_25

    invoke-static {p0}, Lx4o;->c(Landroid/content/Context;)Lx4o;

    move-result-object p0

    new-instance v0, Ltn;

    const-class v1, Lcom/opera/android/notifications/channels/ChannelsUpdateWorker;

    invoke-direct {v0, v1}, Ltn;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v0}, Ltn;->j()Loff;

    move-result-object v0

    const-string v1, "CHUP"

    invoke-virtual {p0, v1, v0}, Lx4o;->b(Ljava/lang/String;Loff;)V

    :cond_25
    return-void
.end method


# virtual methods
.method public final c()Lzic;
    .registers 7

    sget-object p0, Lxs4;->a:Lc5o;

    iget-object v0, p0, Lc5o;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences;

    const/4 v1, -0x1

    const-string v2, "channels_version_key"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/16 v1, 0x12

    if-eq v0, v1, :cond_2d

    iget-object v0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast v0, Lws4;

    iget-object v3, v0, Lws4;->c:Ljava/util/ArrayDeque;

    new-instance v4, Llb4;

    const/4 v5, 0x6

    invoke-direct {v4, v0, v5}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lws4;->b()V

    :try_start_23
    invoke-virtual {v0}, Lws4;->a()V
    :try_end_26
    .catch Ljava/lang/IllegalStateException; {:try_start_23 .. :try_end_26} :catch_2d

    iget-object p0, p0, Lc5o;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v2, v1}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    :catch_2d
    :cond_2d
    new-instance p0, Lyic;

    invoke-direct {p0}, Lyic;-><init>()V

    return-object p0
.end method
