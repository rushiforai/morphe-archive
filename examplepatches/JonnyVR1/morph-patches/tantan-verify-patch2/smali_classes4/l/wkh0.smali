.class public Ll/wkh0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public static volatile b:Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

.field public static volatile c:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "unknown_"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/wkh0;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    sput-object v0, Ll/wkh0;->b:Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Ll/wkh0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;->membership:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static b()Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/wkh0;->b:Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/wkh0;->b:Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    sget-object v0, Ll/wkh0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Ll/wkh0;->b:Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    const-class v0, Ll/wkh0;

    .line 24
    .line 25
    monitor-enter v0

    .line 26
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "male_superlike_optimise"

    .line 31
    .line 32
    sget-object v3, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v1

    .line 42
    goto :goto_1

    .line 43
    :catch_0
    const/4 v1, 0x0

    .line 44
    :goto_0
    :try_start_1
    sget-object v2, Ll/wkh0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 48
    .line 49
    .line 50
    sput-object v1, Ll/wkh0;->b:Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 51
    .line 52
    monitor-exit v0

    .line 53
    return-object v1

    .line 54
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw v1
.end method

.method public static c(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->I4()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialog:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->triggerDialog:Ljava/util/List;

    .line 24
    .line 25
    new-instance v1, Ll/vkh0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/vkh0;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public static d()V
    .locals 2

    .line 1
    const-string v0, "vip"

    .line 2
    .line 3
    invoke-static {v0}, Ll/wkh0;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigTrigger;->defaultCategory:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 14
    .line 15
    sput-object v0, Ll/wkh0;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static e()V
    .locals 2

    .line 1
    sget-object v0, Ll/wkh0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput-object v0, Ll/wkh0;->b:Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 9
    .line 10
    return-void
.end method

.method public static f()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->h3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method
