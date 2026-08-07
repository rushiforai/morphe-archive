.class final Lcom/vivo/push/ups/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/vivo/push/IPushActionListener;


# instance fields
.field final synthetic a:Lcom/vivo/push/ups/UPSRegisterCallback;

.field final synthetic b:Lcom/vivo/push/ups/VUpsManager;


# direct methods
.method public constructor <init>(Lcom/vivo/push/ups/VUpsManager;Lcom/vivo/push/ups/UPSRegisterCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/ups/b;->b:Lcom/vivo/push/ups/VUpsManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/ups/b;->a:Lcom/vivo/push/ups/UPSRegisterCallback;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onStateChanged(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/vivo/push/ups/b;->a:Lcom/vivo/push/ups/UPSRegisterCallback;

    .line 2
    .line 3
    new-instance v0, Lcom/vivo/push/ups/TokenResult;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-direct {v0, p1, v1}, Lcom/vivo/push/ups/TokenResult;-><init>(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Lcom/vivo/push/ups/ICallbackResult;->onResult(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
