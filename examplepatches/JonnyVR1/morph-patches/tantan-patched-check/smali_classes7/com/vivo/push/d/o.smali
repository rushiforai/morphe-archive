.class final Lcom/vivo/push/d/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/vivo/push/b/n;

.field final synthetic b:Lcom/vivo/push/d/n;


# direct methods
.method public constructor <init>(Lcom/vivo/push/d/n;Lcom/vivo/push/b/n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/d/o;->b:Lcom/vivo/push/d/n;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/d/o;->a:Lcom/vivo/push/b/n;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/vivo/push/d/o;->b:Lcom/vivo/push/d/n;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/vivo/push/d/n;->a(Lcom/vivo/push/d/n;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Lcom/vivo/push/d/o;->a:Lcom/vivo/push/b/n;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/vivo/push/b/n;->d()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, p0, Lcom/vivo/push/d/o;->a:Lcom/vivo/push/b/n;

    .line 16
    .line 17
    invoke-virtual {v3}, Lcom/vivo/push/b/n;->e()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iget-object p0, p0, Lcom/vivo/push/d/o;->a:Lcom/vivo/push/b/n;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/vivo/push/b/n;->f()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-interface {v1, v0, v2, v3, p0}, Lcom/vivo/push/sdk/PushMessageCallback;->onLog(Landroid/content/Context;Ljava/lang/String;IZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
