.class final Lcom/vivo/push/d/y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/vivo/push/b/r;

.field final synthetic b:Lcom/vivo/push/d/x;


# direct methods
.method public constructor <init>(Lcom/vivo/push/d/x;Lcom/vivo/push/b/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/d/y;->b:Lcom/vivo/push/d/x;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/d/y;->a:Lcom/vivo/push/b/r;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/vivo/push/d/y;->b:Lcom/vivo/push/d/x;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/vivo/push/d/x;->a(Lcom/vivo/push/d/x;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Lcom/vivo/push/d/y;->a:Lcom/vivo/push/b/r;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/vivo/push/b/s;->h()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object p0, p0, Lcom/vivo/push/d/y;->a:Lcom/vivo/push/b/r;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/vivo/push/b/s;->g()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v1, v0, v2, p0}, Lcom/vivo/push/sdk/PushMessageCallback;->onPublish(Landroid/content/Context;ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
