.class public Ll/zc00;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Ll/zc00;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/ve20;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "+",
            "Ll/lf2;",
            ">;",
            "Ll/lf2;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zc00;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/zc00;->b:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/zc00;->c:Ljava/util/WeakHashMap;

    .line 24
    .line 25
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UserBridgeImplementation;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 28
    .line 29
    .line 30
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/DeviceBridgeImplementation;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 33
    .line 34
    .line 35
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 38
    .line 39
    .line 40
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 43
    .line 44
    .line 45
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/TrackBridgeImplementation;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 48
    .line 49
    .line 50
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/WebViewBridgeImplementation;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 53
    .line 54
    .line 55
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/LocationBridgeImplementation;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 58
    .line 59
    .line 60
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 63
    .line 64
    .line 65
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/StorageBridgeImplementation;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 68
    .line 69
    .line 70
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 73
    .line 74
    .line 75
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 78
    .line 79
    .line 80
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/JumpBridgeImplementation;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 83
    .line 84
    .line 85
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/FeedBackBridgeImplementation;

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 88
    .line 89
    .line 90
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static synthetic a(Ljava/lang/reflect/Method;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "\u4f7f\u7528 @JSCallNativeMethod \u6ce8\u89e3\u7684\u65b9\u6cd5 "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, " \u4e2d\u8bbe\u7f6e uiThread \u4e3a true \u65f6\u65b9\u6cd5\u8fd4\u56de\u503c\u5fc5\u987b\u4e3a\u7a7a"

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public static g()Ll/zc00;
    .locals 2

    .line 1
    sget-object v0, Ll/zc00;->d:Ll/zc00;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/zc00;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/zc00;->d:Ll/zc00;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/zc00;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/zc00;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/zc00;->d:Ll/zc00;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/zc00;->d:Ll/zc00;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/Class;Ll/lf2;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/lf2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Ljava/lang/Class<",
            "+",
            "Ll/lf2;",
            ">;",
            "Ll/lf2;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zc00;->c:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashMap;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/zc00;->c:Ljava/util/WeakHashMap;

    .line 20
    .line 21
    invoke-virtual {p0, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public c(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 3
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/zc00;->c:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/zc00;->c:Ljava/util/WeakHashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Ll/lf2;

    .line 48
    .line 49
    invoke-virtual {v2}, Ll/lf2;->a()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p0, p0, Ll/zc00;->c:Ljava/util/WeakHashMap;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public final d(Ljava/lang/reflect/Method;Ljava/lang/Class;ZZ)Ll/ve20;
    .locals 0

    .line 1
    new-instance p0, Ll/ve20;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ve20;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/ve20;->a:Ljava/lang/reflect/Method;

    .line 7
    .line 8
    iput-object p2, p0, Ll/ve20;->b:Ljava/lang/Class;

    .line 9
    .line 10
    iput-boolean p3, p0, Ll/ve20;->c:Z

    .line 11
    .line 12
    iput-boolean p4, p0, Ll/ve20;->d:Z

    .line 13
    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget-object p3, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    if-eq p2, p3, :cond_0

    .line 23
    .line 24
    new-instance p2, Ll/yc00;

    .line 25
    .line 26
    invoke-direct {p2, p1}, Ll/yc00;-><init>(Ljava/lang/reflect/Method;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-object p0
.end method

.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zc00;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/Class;)Ll/lf2;
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            "Ljava/lang/Class<",
            "+",
            "Ll/lf2;",
            ">;)",
            "Ll/lf2;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zc00;->c:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/lf2;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public h(Ljava/lang/String;)Ll/ve20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zc00;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ve20;

    .line 8
    .line 9
    return-object p0
.end method

.method public i(Ljava/lang/String;)Ll/ve20;
    .locals 14

    .line 1
    invoke-virtual {p0, p1}, Ll/zc00;->h(Ljava/lang/String;)Ll/ve20;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_5

    .line 6
    .line 7
    const-string v1, "@"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x0

    .line 14
    aget-object v2, v2, v3

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v4, 0x1

    .line 21
    aget-object v1, v1, v4

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/zc00;->e()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-eqz v6, :cond_5

    .line 36
    .line 37
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    check-cast v6, Ljava/lang/Class;

    .line 42
    .line 43
    invoke-virtual {v6}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    array-length v8, v7

    .line 48
    move v9, v3

    .line 49
    :goto_0
    if-ge v9, v8, :cond_0

    .line 50
    .line 51
    aget-object v10, v7, v9

    .line 52
    .line 53
    const-class v11, Ll/lkq;

    .line 54
    .line 55
    invoke-virtual {v10, v11}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 56
    .line 57
    .line 58
    move-result v12

    .line 59
    if-eqz v12, :cond_4

    .line 60
    .line 61
    invoke-virtual {v10, v11}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 62
    .line 63
    .line 64
    move-result-object v11

    .line 65
    check-cast v11, Ll/lkq;

    .line 66
    .line 67
    invoke-interface {v11}, Ll/lkq;->nameSpace()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v12

    .line 71
    invoke-interface {v11}, Ll/lkq;->key()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v13

    .line 75
    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v12

    .line 79
    if-eqz v12, :cond_4

    .line 80
    .line 81
    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v12

    .line 85
    if-eqz v12, :cond_4

    .line 86
    .line 87
    invoke-interface {v11}, Ll/lkq;->isMkBridge()Z

    .line 88
    .line 89
    .line 90
    move-result v12

    .line 91
    if-eqz v12, :cond_4

    .line 92
    .line 93
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    array-length v0, v0

    .line 98
    if-lt v0, v4, :cond_1

    .line 99
    .line 100
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    aget-object v0, v0, v3

    .line 105
    .line 106
    const-class v1, Ll/xc00;

    .line 107
    .line 108
    if-eq v0, v1, :cond_2

    .line 109
    .line 110
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 111
    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v2, "\u4f7f\u7528 @JSCallNativeMethod \u6ce8\u89e3\u7684\u65b9\u6cd5 "

    .line 115
    .line 116
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v2, " \u7b2c\u4e00\u4e2a\u53c2\u6570\u5fc5\u987b\u4e3a MkJsBridgeContext"

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 139
    .line 140
    .line 141
    :cond_2
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    array-length v0, v0

    .line 146
    if-le v0, v4, :cond_3

    .line 147
    .line 148
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    aget-object v0, v0, v4

    .line 153
    .line 154
    const-class v1, Lorg/json/JSONObject;

    .line 155
    .line 156
    if-eq v0, v1, :cond_3

    .line 157
    .line 158
    new-instance v0, Ljava/lang/RuntimeException;

    .line 159
    .line 160
    new-instance v1, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    const-string v2, "\u4f7f\u7528 @JSCallNativeMethod \u6ce8\u89e3\u4e14\u662fmk\u7684\u8c03\u7528 "

    .line 163
    .line 164
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v2, "\u7b2c\u4e8c\u4e2a\u53c2\u6570\u5fc5\u987b\u4e3a JSONObject"

    .line 175
    .line 176
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 187
    .line 188
    .line 189
    :cond_3
    invoke-interface {v11}, Ll/lkq;->uiThread()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    invoke-virtual {p0, v10, v6, v0, v4}, Ll/zc00;->d(Ljava/lang/reflect/Method;Ljava/lang/Class;ZZ)Ll/ve20;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {p0, p1, v0}, Ll/zc00;->k(Ljava/lang/String;Ll/ve20;)V

    .line 198
    .line 199
    .line 200
    return-object v0

    .line 201
    :cond_4
    add-int/lit8 v9, v9, 0x1

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :cond_5
    return-object v0
.end method

.method public j(Ljava/lang/Class;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zc00;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/zc00;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k(Ljava/lang/String;Ll/ve20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zc00;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method
