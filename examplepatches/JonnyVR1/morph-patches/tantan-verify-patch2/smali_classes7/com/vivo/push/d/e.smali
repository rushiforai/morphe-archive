.class final Lcom/vivo/push/d/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/vivo/push/b/i;

.field final synthetic c:Lcom/vivo/push/d/d;


# direct methods
.method public constructor <init>(Lcom/vivo/push/d/d;Ljava/lang/String;Lcom/vivo/push/b/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/d/e;->c:Lcom/vivo/push/d/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/d/e;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/vivo/push/d/e;->b:Lcom/vivo/push/b/i;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/vivo/push/d/e;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/vivo/push/d/e;->c:Lcom/vivo/push/d/d;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/vivo/push/d/d;->a(Lcom/vivo/push/d/d;)Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v2, p0, Lcom/vivo/push/d/e;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v1, v0, v2}, Lcom/vivo/push/sdk/PushMessageCallback;->onReceiveRegId(Landroid/content/Context;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/vivo/push/d/e;->c:Lcom/vivo/push/d/d;

    .line 23
    .line 24
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/vivo/push/d/d;->b(Lcom/vivo/push/d/d;)Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p0, Lcom/vivo/push/d/e;->b:Lcom/vivo/push/b/i;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/vivo/push/b/s;->h()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget-object p0, p0, Lcom/vivo/push/d/e;->b:Lcom/vivo/push/b/i;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/vivo/push/b/i;->d()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {v1, v0, v2, p0}, Lcom/vivo/push/sdk/PushMessageCallback;->onBind(Landroid/content/Context;ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
