.class Le/e/a/AppSwitchGuard$1;
.super Ljava/lang/Object;
.source "AppSwitchGuard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/AppSwitchGuard;->intercept(Ljava/lang/Object;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$reference:Ljava/lang/ref/WeakReference;

.field private final synthetic val$transfer:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/Runnable;)V
    .registers 3

    .line 34
    iput-object p1, p0, Le/e/a/AppSwitchGuard$1;->val$reference:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .line 36
    iget-object v0, p0, Le/e/a/AppSwitchGuard$1;->val$reference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 37
    if-nez v0, :cond_b

    return-void

    .line 40
    :cond_b
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    # getter for: Le/e/a/AppSwitchGuard;->STOPPED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    return-void

    .line 41
    :cond_1c
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/util/WeakHashMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_82

    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v1

    if-eqz v1, :cond_30

    goto :goto_82

    .line 44
    :cond_30
    # getter for: Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$2()Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3b

    return-void

    .line 45
    :cond_3b
    iget-object v1, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;

    if-eqz v1, :cond_45

    iget-object v0, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    .line 46
    :cond_45
    const/4 v1, 0x1

    invoke-static {v1}, Le/e/a/AppSwitchGuard;->access$3(Z)V

    .line 48
    const/4 v2, 0x0

    :try_start_4a
    const-string v3, "e.e.a.PlaybackSession"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 49
    const-string v4, "leave"

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/Object;

    aput-object v7, v6, v2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v1

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 50
    new-array v4, v5, [Ljava/lang/Object;

    aput-object v0, v4, v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x0

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_6f} :catch_72
    .catchall {:try_start_4a .. :try_end_6f} :catchall_70

    .line 51
    goto :goto_7a

    .line 53
    :catchall_70
    move-exception v0

    goto :goto_7e

    .line 51
    :catch_72
    move-exception v0

    .line 52
    :try_start_73
    const-string v1, "nicoid-session"

    const-string v3, "Deferred playback policy failed"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7a
    .catchall {:try_start_73 .. :try_end_7a} :catchall_70

    .line 54
    :goto_7a
    invoke-static {v2}, Le/e/a/AppSwitchGuard;->access$3(Z)V

    .line 56
    return-void

    .line 54
    :goto_7e
    invoke-static {v2}, Le/e/a/AppSwitchGuard;->access$3(Z)V

    .line 55
    throw v0

    .line 42
    :cond_82
    :goto_82
    return-void
.end method
