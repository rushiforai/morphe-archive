.class Lcom/quickjs/plugin/WorkerPlugin$Worker$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/quickjs/plugin/WorkerPlugin$Worker;-><init>(Lcom/quickjs/plugin/WorkerPlugin;Lcom/quickjs/JSObject;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/quickjs/plugin/WorkerPlugin$Worker;

.field final synthetic val$url:Ljava/lang/String;

.field final synthetic val$workerPlugin:Lcom/quickjs/plugin/WorkerPlugin;


# direct methods
.method public constructor <init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;Lcom/quickjs/plugin/WorkerPlugin;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;->this$0:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;->val$workerPlugin:Lcom/quickjs/plugin/WorkerPlugin;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;->val$url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;->this$0:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->access$100(Lcom/quickjs/plugin/WorkerPlugin$Worker;)Lcom/quickjs/JSContext;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;->val$workerPlugin:Lcom/quickjs/plugin/WorkerPlugin;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;->val$url:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/quickjs/plugin/WorkerPlugin;->getScript(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object p0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;->val$url:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Lcom/quickjs/JSContext;->executeVoidScript(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
