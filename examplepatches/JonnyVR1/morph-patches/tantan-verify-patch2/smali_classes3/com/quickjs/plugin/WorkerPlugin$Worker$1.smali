.class Lcom/quickjs/plugin/WorkerPlugin$Worker$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaVoidCallback;


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


# direct methods
.method public constructor <init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$1;->this$0:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p2, p1}, Lcom/quickjs/JSArray;->getString(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iget-object p0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker$1;->this$0:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->access$000(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
