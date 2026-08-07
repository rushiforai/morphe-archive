.class public Lcom/quickjs/JSContext;
.super Lcom/quickjs/JSObject;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field final contextPtr:J

.field final functionRegistry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/quickjs/QuickJS$MethodDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field final plugins:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/quickjs/Plugin;",
            ">;"
        }
    .end annotation
.end field

.field final quickJS:Lcom/quickjs/QuickJS;

.field final refs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/quickjs/JSValue;",
            ">;"
        }
    .end annotation
.end field

.field final releaseObjPtrPool:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final skippedPtrs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/quickjs/QuickJS;J)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/quickjs/QuickJS;->getNative()Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p2, p3}, Lcom/quickjs/QuickJSNative;->_getGlobalObject(J)Lcom/quickjs/JSObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {p0, v1, v0}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/quickjs/JSContext;->plugins:Ljava/util/Set;

    .line 23
    .line 24
    new-instance v0, Ljava/util/WeakHashMap;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/quickjs/JSContext;->refs:Ljava/util/Map;

    .line 34
    .line 35
    new-instance v0, Ljava/util/LinkedList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/quickjs/JSContext;->releaseObjPtrPool:Ljava/util/List;

    .line 45
    .line 46
    new-instance v0, Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/quickjs/JSContext;->functionRegistry:Ljava/util/Map;

    .line 56
    .line 57
    new-instance v0, Ljava/util/HashSet;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/quickjs/JSContext;->skippedPtrs:Ljava/util/Set;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/quickjs/JSContext;->quickJS:Lcom/quickjs/QuickJS;

    .line 69
    .line 70
    iput-wide p2, p0, Lcom/quickjs/JSContext;->contextPtr:J

    .line 71
    .line 72
    iput-object p0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 73
    .line 74
    sget-object p1, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 75
    .line 76
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic access$001(Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/quickjs/JSValue;->close()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private checkReleaseObjPtrPool()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getQuickJS()Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nkq;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/nkq;-><init>(Lcom/quickjs/JSContext;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/quickjs/QuickJS;->postEventQueue(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic g(Lcom/quickjs/JSContext;)V
    .locals 14

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/quickjs/JSContext;->releaseObjPtrPool:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/quickjs/JSContext;->releaseObjPtrPool:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, [Ljava/lang/Object;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/quickjs/JSContext;->skippedPtrs:Ljava/util/Set;

    .line 19
    .line 20
    const/4 v3, 0x3

    .line 21
    aget-object v4, v0, v3

    .line 22
    .line 23
    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 35
    .line 36
    .line 37
    move-result-wide v5

    .line 38
    aget-object v2, v0, v1

    .line 39
    .line 40
    check-cast v2, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v7

    .line 46
    const/4 v2, 0x1

    .line 47
    aget-object v2, v0, v2

    .line 48
    .line 49
    check-cast v2, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    const/4 v2, 0x2

    .line 56
    aget-object v2, v0, v2

    .line 57
    .line 58
    check-cast v2, Ljava/lang/Double;

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 61
    .line 62
    .line 63
    move-result-wide v10

    .line 64
    aget-object v2, v0, v3

    .line 65
    .line 66
    check-cast v2, Ljava/lang/Long;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 69
    .line 70
    .line 71
    move-result-wide v12

    .line 72
    invoke-interface/range {v4 .. v13}, Lcom/quickjs/QuickJSNative;->_releasePtr(JJIDJ)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    iget-object v2, p0, Lcom/quickjs/JSContext;->skippedPtrs:Ljava/util/Set;

    .line 79
    .line 80
    aget-object v0, v0, v3

    .line 81
    .line 82
    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/quickjs/JSContext;->releaseObjPtrPool:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    iget-object v0, p0, Lcom/quickjs/JSContext;->skippedPtrs:Ljava/util/Set;

    .line 92
    .line 93
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_3

    .line 98
    .line 99
    iget-object p0, p0, Lcom/quickjs/JSContext;->skippedPtrs:Ljava/util/Set;

    .line 100
    .line 101
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 102
    .line 103
    .line 104
    :cond_3
    return-void
.end method

.method public static synthetic h(Lcom/quickjs/JSContext;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/quickjs/JSValue;->released:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/quickjs/JSContext;->plugins:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/quickjs/Plugin;

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Lcom/quickjs/Plugin;->close(Lcom/quickjs/JSContext;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/quickjs/JSContext;->plugins:Ljava/util/Set;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/quickjs/JSContext;->functionRegistry:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/quickjs/JSContext;->refs:Ljava/util/Map;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x0

    .line 45
    new-array v2, v1, [Lcom/quickjs/JSValue;

    .line 46
    .line 47
    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, [Lcom/quickjs/JSValue;

    .line 52
    .line 53
    array-length v2, v0

    .line 54
    :goto_1
    if-ge v1, v2, :cond_3

    .line 55
    .line 56
    aget-object v3, v0, v1

    .line 57
    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/quickjs/JSValue;->close()V

    .line 61
    .line 62
    .line 63
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    invoke-direct {p0}, Lcom/quickjs/JSContext;->checkReleaseObjPtrPool()V

    .line 67
    .line 68
    .line 69
    invoke-static {p0}, Lcom/quickjs/JSContext;->access$001(Lcom/quickjs/JSContext;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-wide v1, p0, Lcom/quickjs/JSContext;->contextPtr:J

    .line 77
    .line 78
    invoke-interface {v0, v1, v2}, Lcom/quickjs/QuickJSNative;->_releaseContext(J)V

    .line 79
    .line 80
    .line 81
    sget-object v0, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 84
    .line 85
    .line 86
    move-result-wide v1

    .line 87
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    return-void
.end method


# virtual methods
.method public _registerCallback(Lcom/quickjs/JavaCallback;Lcom/quickjs/JSFunction;)V
    .locals 0

    .line 1
    new-instance p2, Lcom/quickjs/QuickJS$MethodDescriptor;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/quickjs/QuickJS$MethodDescriptor;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p2, Lcom/quickjs/QuickJS$MethodDescriptor;->callback:Lcom/quickjs/JavaCallback;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/quickjs/JSContext;->functionRegistry:Ljava/util/Map;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public _registerCallback(Lcom/quickjs/JavaVoidCallback;Lcom/quickjs/JSFunction;)V
    .locals 0

    .line 22
    new-instance p2, Lcom/quickjs/QuickJS$MethodDescriptor;

    invoke-direct {p2}, Lcom/quickjs/QuickJS$MethodDescriptor;-><init>()V

    .line 23
    iput-object p1, p2, Lcom/quickjs/QuickJS$MethodDescriptor;->voidCallback:Lcom/quickjs/JavaVoidCallback;

    .line 24
    iget-object p0, p0, Lcom/quickjs/JSContext;->functionRegistry:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public addObjRef(Lcom/quickjs/JSValue;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/quickjs/JSContext;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/quickjs/JSContext;->refs:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public addPlugin(Lcom/quickjs/Plugin;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/quickjs/JSContext;->plugins:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/quickjs/Plugin;->setup(Lcom/quickjs/JSContext;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/quickjs/JSContext;->plugins:Ljava/util/Set;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public checkReleased()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/quickjs/JSContext;->checkReleaseObjPtrPool()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->isReleased()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance p0, Ljava/lang/Error;

    .line 12
    .line 13
    const-string v0, "Context disposed error"

    .line 14
    .line 15
    invoke-direct {p0, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    throw p0
.end method

.method public checkRuntime(Lcom/quickjs/JSValue;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/quickjs/JSValue;->isUndefined()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object p1, p1, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 10
    .line 11
    const-string v0, "Invalid target runtime"

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p1, Lcom/quickjs/JSContext;->quickJS:Lcom/quickjs/QuickJS;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/quickjs/QuickJS;->isReleased()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/quickjs/JSContext;->quickJS:Lcom/quickjs/QuickJS;

    .line 26
    .line 27
    if-ne p1, p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance p0, Ljava/lang/Error;

    .line 31
    .line 32
    invoke-direct {p0, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw p0

    .line 36
    :cond_1
    new-instance p0, Ljava/lang/Error;

    .line 37
    .line 38
    invoke-direct {p0, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p0

    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public close()V
    .locals 1

    .line 1
    new-instance v0, Ll/mkq;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mkq;-><init>(Lcom/quickjs/JSContext;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/quickjs/JSValue;->postEventQueue(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public executeArrayScript(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSArray;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_ARRAY:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/quickjs/JSArray;

    .line 8
    .line 9
    return-object p0
.end method

.method public executeBinaryScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iget v3, p1, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 10
    .line 11
    move-object v4, p2

    .line 12
    move v5, p3

    .line 13
    invoke-interface/range {v0 .. v5}, Lcom/quickjs/QuickJSNative;->_executeBinaryScript(JILjava/lang/String;I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/quickjs/QuickJS;->checkException(Lcom/quickjs/JSContext;)V

    .line 20
    .line 21
    .line 22
    return-object p1
.end method

.method public executeBinaryScript(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 23
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/quickjs/JSContext;->executeBinaryScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public executeBooleanScript(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->BOOLEAN:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public executeDoubleScript(Ljava/lang/String;Ljava/lang/String;)D
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->DOUBLE:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public executeIntegerScript(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->INTEGER:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public executeModuleScript(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    sget-object p3, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    .line 10
    .line 11
    iget v3, p3, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 12
    .line 13
    sget v6, Lcom/quickjs/QuickJS;->JS_EVAL_TYPE_MODULE:I

    .line 14
    .line 15
    move-object v4, p1

    .line 16
    move-object v5, p2

    .line 17
    invoke-interface/range {v0 .. v6}, Lcom/quickjs/QuickJSNative;->_executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/quickjs/QuickJS;->checkException(Lcom/quickjs/JSContext;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public executeObjectBinaryScript(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_OBJECT:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, p1, v1}, Lcom/quickjs/JSContext;->executeBinaryScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public executeObjectScript(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_OBJECT:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/quickjs/JSObject;

    .line 8
    .line 9
    return-object p0
.end method

.method public executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    move-result-object v0

    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    move-result-wide v1

    iget v3, p1, Lcom/quickjs/JSValue$TYPE;->value:I

    sget v6, Lcom/quickjs/QuickJS;->JS_EVAL_TYPE_GLOBAL:I

    move-object v4, p2

    move-object v5, p3

    invoke-interface/range {v0 .. v6}, Lcom/quickjs/QuickJSNative;->_executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    .line 28
    iget-object p0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    invoke-static {p0}, Lcom/quickjs/QuickJS;->checkException(Lcom/quickjs/JSContext;)V

    return-object p1
.end method

.method public executeScript(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 26
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public executeScript(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    sget-object v3, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    .line 10
    .line 11
    iget v3, v3, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 12
    .line 13
    move-object v4, p1

    .line 14
    move-object v5, p2

    .line 15
    move v6, p3

    .line 16
    invoke-interface/range {v0 .. v6}, Lcom/quickjs/QuickJSNative;->_executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/quickjs/QuickJS;->checkException(Lcom/quickjs/JSContext;)V

    .line 23
    .line 24
    .line 25
    return-object p1
.end method

.method public executeStringScript(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->STRING:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public executeVoidBinaryScript(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->NULL:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, p1, v1}, Lcom/quickjs/JSContext;->executeBinaryScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public executeVoidScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->NULL:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getContextPtr()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/quickjs/JSContext;->contextPtr:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getNative()Lcom/quickjs/QuickJSNative;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/JSContext;->quickJS:Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/quickjs/QuickJS;->getNative()Lcom/quickjs/QuickJSNative;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getQuickJS()Lcom/quickjs/QuickJS;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/JSContext;->quickJS:Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    return-object p0
.end method

.method public isReleased()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getQuickJS()Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/quickjs/QuickJS;->isReleased()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    iget-boolean p0, p0, Lcom/quickjs/JSValue;->released:Z

    .line 14
    .line 15
    return p0
.end method

.method public releaseObjRef(Lcom/quickjs/JSValue;Z)V
    .locals 11

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/quickjs/JSContext;->releaseObjPtrPool:Ljava/util/List;

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/quickjs/JSValue;->tag:J

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p1, Lcom/quickjs/JSValue;->u_int32:I

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-wide v2, p1, Lcom/quickjs/JSValue;->u_float64:D

    .line 18
    .line 19
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-wide v3, p1, Lcom/quickjs/JSValue;->u_ptr:J

    .line 24
    .line 25
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 42
    .line 43
    .line 44
    move-result-wide v2

    .line 45
    iget-wide v4, p1, Lcom/quickjs/JSValue;->tag:J

    .line 46
    .line 47
    iget v6, p1, Lcom/quickjs/JSValue;->u_int32:I

    .line 48
    .line 49
    iget-wide v7, p1, Lcom/quickjs/JSValue;->u_float64:D

    .line 50
    .line 51
    iget-wide v9, p1, Lcom/quickjs/JSValue;->u_ptr:J

    .line 52
    .line 53
    invoke-interface/range {v1 .. v10}, Lcom/quickjs/QuickJSNative;->_releasePtr(JJIDJ)Z

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-virtual {p0, p1}, Lcom/quickjs/JSContext;->removeObjRef(Lcom/quickjs/JSValue;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public removeObjRef(Lcom/quickjs/JSValue;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/JSContext;->refs:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method
