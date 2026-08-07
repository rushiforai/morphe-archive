.class final Lcom/vivo/push/ups/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/vivo/push/IPushActionListener;


# instance fields
.field final synthetic a:Lcom/vivo/push/ups/UPSRegisterCallback;

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:Lcom/vivo/push/ups/VUpsManager;


# direct methods
.method public constructor <init>(Lcom/vivo/push/ups/VUpsManager;Lcom/vivo/push/ups/UPSRegisterCallback;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/ups/a;->c:Lcom/vivo/push/ups/VUpsManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/ups/a;->a:Lcom/vivo/push/ups/UPSRegisterCallback;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/vivo/push/ups/a;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onStateChanged(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/vivo/push/ups/a;->a:Lcom/vivo/push/ups/UPSRegisterCallback;

    .line 2
    .line 3
    new-instance v1, Lcom/vivo/push/ups/TokenResult;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/vivo/push/ups/a;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/vivo/push/PushClient;->getRegId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v1, p1, p0}, Lcom/vivo/push/ups/TokenResult;-><init>(ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1}, Lcom/vivo/push/ups/ICallbackResult;->onResult(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
