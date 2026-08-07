.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/api/g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->setAuthEventCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAuthEvent(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;->onAuthEvent(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onAuthTipsEvent(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;->onAuthTipsEvent(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onBeginTransition()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;->onBeginTransition()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onEndTransition()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;->onEndTransition()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onMainViewCreate(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;->onMainViewCreate(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onMainViewDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;->onMainViewDestroy()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
