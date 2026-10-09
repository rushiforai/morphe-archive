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

    .line 33
    iput-object p1, p0, Le/e/a/AppSwitchGuard$1;->val$reference:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .line 35
    iget-object v0, p0, Le/e/a/AppSwitchGuard$1;->val$reference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 36
    if-nez v0, :cond_b

    return-void

    .line 37
    :cond_b
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    # getter for: Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1d

    return-void

    .line 40
    :cond_1d
    iget-object v1, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;

    if-eqz v1, :cond_27

    iget-object v0, p0, Le/e/a/AppSwitchGuard$1;->val$transfer:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    .line 41
    :cond_27
    const/4 v1, 0x1

    invoke-static {v1}, Le/e/a/AppSwitchGuard;->access$2(Z)V

    .line 43
    const/4 v2, 0x0

    :try_start_2c
    const-string v3, "e.e.a.PlaybackSession"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 44
    const-string v4, "leave"

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/Object;

    aput-object v7, v6, v2

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v1

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 45
    new-array v4, v5, [Ljava/lang/Object;

    aput-object v0, v4, v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x0

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_51} :catch_54
    .catchall {:try_start_2c .. :try_end_51} :catchall_52

    .line 46
    goto :goto_5c

    .line 48
    :catchall_52
    move-exception v0

    goto :goto_60

    .line 46
    :catch_54
    move-exception v0

    .line 47
    :try_start_55
    const-string v1, "nicoid-session"

    const-string v3, "Deferred playback policy failed"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5c
    .catchall {:try_start_55 .. :try_end_5c} :catchall_52

    .line 49
    :goto_5c
    invoke-static {v2}, Le/e/a/AppSwitchGuard;->access$2(Z)V

    .line 51
    return-void

    .line 49
    :goto_60
    invoke-static {v2}, Le/e/a/AppSwitchGuard;->access$2(Z)V

    .line 50
    throw v0
.end method
