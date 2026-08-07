.class public Ll/cqq;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Ll/cqq;


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
            "Lcom/p1/mobile/putong/app/web/WebViewX;",
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
    iput-object v0, p0, Ll/cqq;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/cqq;->b:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/cqq;->c:Ljava/util/WeakHashMap;

    .line 24
    .line 25
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UserBridgeImplementation;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 28
    .line 29
    .line 30
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/DeviceBridgeImplementation;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 33
    .line 34
    .line 35
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 38
    .line 39
    .line 40
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ThirdPartFuncBridgeImplementation;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 43
    .line 44
    .line 45
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/TrackBridgeImplementation;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 48
    .line 49
    .line 50
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/WebViewBridgeImplementation;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 53
    .line 54
    .line 55
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/LocationBridgeImplementation;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 58
    .line 59
    .line 60
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 63
    .line 64
    .line 65
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/StorageBridgeImplementation;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 68
    .line 69
    .line 70
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ActionBridgeImplementation;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 73
    .line 74
    .line 75
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 78
    .line 79
    .line 80
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/JumpBridgeImplementation;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 83
    .line 84
    .line 85
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/FeedBackBridgeImplementation;

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 88
    .line 89
    .line 90
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/SliderBridgeImplementation;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 93
    .line 94
    .line 95
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/ExportedBridgeImplementation;

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 98
    .line 99
    .line 100
    const-class v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/HttpBridgeImplementation;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static e()Ll/cqq;
    .locals 2

    .line 1
    sget-object v0, Ll/cqq;->d:Ll/cqq;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/cqq;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/cqq;->d:Ll/cqq;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/cqq;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/cqq;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/cqq;->d:Ll/cqq;

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
    sget-object v0, Ll/cqq;->d:Ll/cqq;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/Class;Ll/lf2;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/app/web/WebViewX;
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
            "Lcom/p1/mobile/putong/app/web/WebViewX;",
            "Ljava/lang/Class<",
            "+",
            "Ll/lf2;",
            ">;",
            "Ll/lf2;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cqq;->c:Ljava/util/WeakHashMap;

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
    iget-object p0, p0, Ll/cqq;->c:Ljava/util/WeakHashMap;

    .line 20
    .line 21
    invoke-virtual {p0, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/app/web/WebViewX;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/app/web/WebViewX;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/cqq;->c:Ljava/util/WeakHashMap;

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
    iget-object v0, p0, Ll/cqq;->c:Ljava/util/WeakHashMap;

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
    iget-object p0, p0, Ll/cqq;->c:Ljava/util/WeakHashMap;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public c()Ljava/util/List;
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
    iget-object p0, p0, Ll/cqq;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/Class;)Ll/lf2;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/app/web/WebViewX;
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
            "Lcom/p1/mobile/putong/app/web/WebViewX;",
            "Ljava/lang/Class<",
            "+",
            "Ll/lf2;",
            ">;)",
            "Ll/lf2;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cqq;->c:Ljava/util/WeakHashMap;

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

.method public f(Ljava/lang/String;)Ll/ve20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqq;->a:Ljava/util/HashMap;

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

.method public g(Ljava/lang/String;[Ljava/lang/Object;)Ll/ve20;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v4, "@@___@@"

    .line 16
    .line 17
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    array-length v4, v2

    .line 21
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v0, v3}, Ll/cqq;->f(Ljava/lang/String;)Ll/ve20;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    if-nez v4, :cond_5

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/cqq;->c()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    if-eqz v6, :cond_5

    .line 47
    .line 48
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    check-cast v6, Ljava/lang/Class;

    .line 53
    .line 54
    invoke-virtual {v6}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    array-length v8, v7

    .line 59
    const/4 v9, 0x0

    .line 60
    move v10, v9

    .line 61
    :goto_0
    if-ge v10, v8, :cond_0

    .line 62
    .line 63
    aget-object v11, v7, v10

    .line 64
    .line 65
    const-class v12, Ll/lkq;

    .line 66
    .line 67
    invoke-virtual {v11, v12}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 68
    .line 69
    .line 70
    move-result v13

    .line 71
    if-eqz v13, :cond_4

    .line 72
    .line 73
    invoke-virtual {v11, v12}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 74
    .line 75
    .line 76
    move-result-object v12

    .line 77
    check-cast v12, Ll/lkq;

    .line 78
    .line 79
    invoke-interface {v12}, Ll/lkq;->key()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v13

    .line 83
    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v13

    .line 87
    if-eqz v13, :cond_4

    .line 88
    .line 89
    invoke-interface {v12}, Ll/lkq;->isMkBridge()Z

    .line 90
    .line 91
    .line 92
    move-result v13

    .line 93
    if-nez v13, :cond_4

    .line 94
    .line 95
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    move-result-object v13

    .line 99
    array-length v13, v13

    .line 100
    const-string v14, "\u4f7f\u7528 @JSCallNativeMethod \u6ce8\u89e3\u7684\u65b9\u6cd5 "

    .line 101
    .line 102
    const/4 v15, 0x1

    .line 103
    if-lt v13, v15, :cond_2

    .line 104
    .line 105
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    move-result-object v13

    .line 109
    aget-object v13, v13, v9

    .line 110
    .line 111
    const-class v9, Ll/aqq;

    .line 112
    .line 113
    if-eq v13, v9, :cond_1

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_1
    move/from16 v16, v15

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_2
    :goto_1
    new-instance v9, Ljava/lang/RuntimeException;

    .line 120
    .line 121
    new-instance v13, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    move/from16 v16, v15

    .line 127
    .line 128
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v15

    .line 132
    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v15, " \u7b2c\u4e00\u4e2a\u53c2\u6570\u5fc5\u987b\u4e3a JsBridgeContext"

    .line 136
    .line 137
    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v13

    .line 144
    invoke-direct {v9, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v9}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    :goto_2
    array-length v9, v2

    .line 151
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 152
    .line 153
    .line 154
    move-result-object v13

    .line 155
    array-length v13, v13

    .line 156
    add-int/lit8 v13, v13, -0x1

    .line 157
    .line 158
    if-ne v9, v13, :cond_4

    .line 159
    .line 160
    new-instance v1, Ll/ve20;

    .line 161
    .line 162
    invoke-direct {v1}, Ll/ve20;-><init>()V

    .line 163
    .line 164
    .line 165
    iput-object v11, v1, Ll/ve20;->a:Ljava/lang/reflect/Method;

    .line 166
    .line 167
    iput-object v6, v1, Ll/ve20;->b:Ljava/lang/Class;

    .line 168
    .line 169
    invoke-interface {v12}, Ll/lkq;->uiThread()Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    iput-boolean v2, v1, Ll/ve20;->c:Z

    .line 174
    .line 175
    if-eqz v2, :cond_3

    .line 176
    .line 177
    iget-object v2, v1, Ll/ve20;->a:Ljava/lang/reflect/Method;

    .line 178
    .line 179
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    .line 184
    .line 185
    if-eq v2, v4, :cond_3

    .line 186
    .line 187
    new-instance v2, Ljava/lang/RuntimeException;

    .line 188
    .line 189
    new-instance v4, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v4, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    const-string v5, " \u4e2d\u8bbe\u7f6e uiThread \u4e3a true \u65f6\u65b9\u6cd5\u8fd4\u56de\u503c\u5fc5\u987b\u4e3a\u7a7a"

    .line 202
    .line 203
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-direct {v2, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 214
    .line 215
    .line 216
    :cond_3
    invoke-virtual {v0, v3, v1}, Ll/cqq;->i(Ljava/lang/String;Ll/ve20;)V

    .line 217
    .line 218
    .line 219
    return-object v1

    .line 220
    :cond_4
    add-int/lit8 v10, v10, 0x1

    .line 221
    .line 222
    const/4 v9, 0x0

    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :cond_5
    return-object v4
.end method

.method public h(Ljava/lang/Class;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cqq;->b:Ljava/util/List;

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
    iget-object p0, p0, Ll/cqq;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/zc00;->g()Ll/zc00;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Ll/zc00;->j(Ljava/lang/Class;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public i(Ljava/lang/String;Ll/ve20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqq;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method
