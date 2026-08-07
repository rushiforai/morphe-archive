.class Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$3;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->k1(Ll/xc00;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

.field final synthetic val$act:Lcom/p1/mobile/putong/app/PutongAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Landroid/os/Handler;Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$3;->this$0:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$3;->val$act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p2, -0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge$3;->val$act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method
