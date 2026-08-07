.class public final synthetic Lcom/quickjs/plugin/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/quickjs/plugin/WorkerPlugin$Worker;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/plugin/c;->a:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    iput-object p2, p0, Lcom/quickjs/plugin/c;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/quickjs/plugin/c;->a:Lcom/quickjs/plugin/WorkerPlugin$Worker;

    iget-object p0, p0, Lcom/quickjs/plugin/c;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->e(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V

    return-void
.end method
