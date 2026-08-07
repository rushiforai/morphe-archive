.class final Lcom/vivo/push/d/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/vivo/push/model/UnvarnishedMessage;

.field final synthetic b:Lcom/vivo/push/d/p;


# direct methods
.method public constructor <init>(Lcom/vivo/push/d/p;Lcom/vivo/push/model/UnvarnishedMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/d/q;->b:Lcom/vivo/push/d/p;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/d/q;->a:Lcom/vivo/push/model/UnvarnishedMessage;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/vivo/push/d/q;->b:Lcom/vivo/push/d/p;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/vivo/push/d/p;->a(Lcom/vivo/push/d/p;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/vivo/push/d/q;->a:Lcom/vivo/push/model/UnvarnishedMessage;

    .line 10
    .line 11
    invoke-interface {v1, v0, p0}, Lcom/vivo/push/sdk/PushMessageCallback;->onTransmissionMessage(Landroid/content/Context;Lcom/vivo/push/model/UnvarnishedMessage;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
