.class public final Le/e/a/PlaybackLifecycle219;
.super Ljava/lang/Object;
.source "PlaybackLifecycle219.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlaybackLifecycle219$Snapshot;
    }
.end annotation


# static fields
.field private static final PAUSED:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/PlaybackLifecycle219$Snapshot;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackLifecycle219;->PAUSED:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static destroy(Ljava/lang/Object;)V
    .registers 2

    invoke-static {p0}, Le/e/a/MiniSession225;->destroyed(Ljava/lang/Object;)V

    .line 29
    sget-object v0, Le/e/a/PlaybackLifecycle219;->PAUSED:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->destroyed(Ljava/lang/Object;)V

    return-void
.end method

.method public static resume(Ljava/lang/Object;)V
    .registers 5

    .line 23
    sget-object v0, Le/e/a/PlaybackLifecycle219;->PAUSED:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackLifecycle219$Snapshot;

    if-nez v0, :cond_b

    return-void

    .line 24
    :cond_b
    :try_start_b
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    const-string v2, "a0"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v1, :cond_5e

    .line 25
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_5e

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_5e

    iget-object v1, v0, Le/e/a/PlaybackLifecycle219$Snapshot;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v2, v1, :cond_5e

    iget-object v1, v0, Le/e/a/PlaybackLifecycle219$Snapshot;->id:Ljava/lang/String;

    const-string v3, "b0"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    goto :goto_5e

    .line 26
    :cond_42
    iget-boolean p0, v0, Le/e/a/PlaybackLifecycle219$Snapshot;->resume:Z

    if-eqz p0, :cond_58

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v0, "start"

    const/4 v1, 0x0

    new-array v3, v1, [Ljava/lang/Class;

    invoke-virtual {p0, v0, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    :cond_58
    const-string p0, "Playback resumed from retained session"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_5d} :catch_5f

    goto :goto_67

    :cond_5e
    :goto_5e
    return-void

    :catch_5f
    move-exception p0

    .line 28
    const-string v0, "nicoid-session"

    const-string v1, "Cannot resume retained playback"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_67
    return-void
.end method

.method public static retain(Ljava/lang/Object;)Z
    .registers 10

    const/4 v0, 0x0

    .line 13
    :try_start_1
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-eqz v1, :cond_ca

    .line 14
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_ca

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_ca

    invoke-virtual {v1}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v2

    if-nez v2, :cond_ca

    const-string v2, "x0"

    invoke-static {p0, v2}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_27

    goto/16 :goto_ca

    .line 15
    :cond_27
    invoke-static {p0}, Le/e/a/MiniSession225;->owns(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2f

    const/4 v2, 0x1

    return v2

    :cond_2f
    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->retaining(Landroid/app/Activity;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_37

    return v2

    .line 16
    :cond_37
    const-string v1, "a0"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v3, "b0"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    if-eqz v1, :cond_ca

    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getDuration"

    new-array v6, v0, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Object;

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-gtz v8, :cond_68

    goto :goto_ca

    .line 18
    :cond_68
    sget-object v4, Le/e/a/PlaybackLifecycle219;->PAUSED:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/PlaybackLifecycle219$Snapshot;

    if-eqz v5, :cond_83

    iget-object v6, v5, Le/e/a/PlaybackLifecycle219$Snapshot;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v1, :cond_83

    iget-object v5, v5, Le/e/a/PlaybackLifecycle219$Snapshot;->id:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_83

    return v2

    .line 19
    :cond_83
    new-instance v5, Le/e/a/PlaybackLifecycle219$Snapshot;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Le/e/a/PlaybackLifecycle219$Snapshot;-><init>(Le/e/a/PlaybackLifecycle219$Snapshot;)V

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v6, v5, Le/e/a/PlaybackLifecycle219$Snapshot;->player:Ljava/lang/ref/WeakReference;

    iput-object v3, v5, Le/e/a/PlaybackLifecycle219$Snapshot;->id:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "isPlaying"

    new-array v8, v0, [Ljava/lang/Class;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-array v7, v0, [Ljava/lang/Object;

    invoke-virtual {v6, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    iput-boolean v3, v5, Le/e/a/PlaybackLifecycle219$Snapshot;->resume:Z

    .line 20
    iget-boolean v3, v5, Le/e/a/PlaybackLifecycle219$Snapshot;->resume:Z

    if-eqz v3, :cond_c1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v6, "pause"

    new-array v7, v0, [Ljava/lang/Class;

    invoke-virtual {v3, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v6, v0, [Ljava/lang/Object;

    invoke-virtual {v3, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c1
    invoke-virtual {v4, p0, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    const-string p0, "Playback retained while activity stopped"

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_c9} :catch_cb

    return v2

    :cond_ca
    :goto_ca
    return v0

    :catch_cb
    move-exception p0

    .line 22
    const-string v1, "nicoid-session"

    const-string v2, "Cannot retain stopped playback"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public static retryAllowed(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x0

    .line 35
    :try_start_1
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-eqz v1, :cond_3d

    .line 36
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_3d

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_3d

    sget-object v2, Le/e/a/PlaybackLifecycle219;->PAUSED:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3d

    invoke-static {v1}, Le/e/a/PlaybackTransfer221;->retaining(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_3d

    const-string v1, "x0"

    invoke-static {p0, v1}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3d

    const-string v1, "M0"

    invoke-static {p0, v1}, Le/e/a/PlayerGestures219;->flag(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-static {p0}, Le/e/a/PlaybackSession;->allowRetry(Ljava/lang/Object;)Z

    move-result p0
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_39} :catch_3d

    if-eqz p0, :cond_3d

    const/4 p0, 0x1

    return p0

    :catch_3d
    :cond_3d
    return v0
.end method

.method public static retryTask(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x0

    .line 30
    :try_start_1
    const-string v1, "fragment"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PlaybackLifecycle219;->retryAllowed(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    return v0

    .line 31
    :cond_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "$Retry"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_41

    const-string v2, "model"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "h1"

    invoke-static {v1, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-ne v2, v4, :cond_40

    const-string v2, "id"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v2, "b0"

    invoke-static {v1, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_40

    return v3

    :cond_40
    return v0

    .line 32
    :cond_41
    const-string v2, "g1"

    invoke-static {v1, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5c

    const-string v2, "url"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v2, "d"

    invoke-static {v1, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_59} :catch_5c

    if-eqz p0, :cond_5c

    return v3

    :catch_5c
    :cond_5c
    return v0
.end method
