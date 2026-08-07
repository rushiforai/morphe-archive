.class public abstract Lcom/quickjs/plugin/WorkerPlugin;
.super Lcom/quickjs/Plugin;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/quickjs/plugin/WorkerPlugin$Worker;
    }
.end annotation


# instance fields
.field private workers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/quickjs/plugin/WorkerPlugin$Worker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/quickjs/Plugin;-><init>()V

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
    iput-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin;->workers:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/quickjs/plugin/WorkerPlugin;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p2, v0}, Lcom/quickjs/JSArray;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin;->workers:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/quickjs/JSValue;->getTag()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Lcom/quickjs/plugin/WorkerPlugin$Worker;

    .line 20
    .line 21
    invoke-direct {v2, p0, p1, p2}, Lcom/quickjs/plugin/WorkerPlugin$Worker;-><init>(Lcom/quickjs/plugin/WorkerPlugin;Lcom/quickjs/JSObject;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public close(Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/plugin/WorkerPlugin;->workers:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/quickjs/plugin/WorkerPlugin$Worker;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->close()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public abstract getScript(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public setup(Lcom/quickjs/JSContext;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ikq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ikq0;-><init>(Lcom/quickjs/plugin/WorkerPlugin;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "Worker"

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/quickjs/JSObject;->registerClass(Lcom/quickjs/JavaConstructorCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 9
    .line 10
    .line 11
    return-void
.end method
