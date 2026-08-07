.class public final synthetic Lcom/quickjs/plugin/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaVoidCallback;


# instance fields
.field public final synthetic a:Lcom/quickjs/plugin/WorkerPlugin$Worker;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/plugin/b;->a:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/plugin/b;->a:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    invoke-static {p0, p1, p2}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->b(Lcom/quickjs/plugin/WorkerPlugin$Worker;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V

    return-void
.end method
