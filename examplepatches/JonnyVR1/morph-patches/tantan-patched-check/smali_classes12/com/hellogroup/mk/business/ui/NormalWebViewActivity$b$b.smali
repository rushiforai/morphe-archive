.class final Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->openUrlByTarget(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    iput-object p2, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->b:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->W0()Lkotlin/jvm/functions/Function4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->b()Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v3, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 15
    .line 16
    invoke-virtual {v3}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->c()Ll/x40;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v3, v3, Ll/x40;->f:Landroid/webkit/WebView;

    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    iget-object v4, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->b:Lorg/json/JSONObject;

    .line 26
    .line 27
    invoke-interface {v0, v2, v3, v1, v4}, Lkotlin/jvm/functions/Function4;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lkotlin/Unit;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    sget-object v0, Ll/hm3;->Companion:Ll/hm3$a;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->b()Landroid/app/Activity;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget-object v3, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->a:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->c()Ll/x40;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget-object v3, v3, Ll/x40;->f:Landroid/webkit/WebView;

    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b$b;->b:Lorg/json/JSONObject;

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3, v1, p0}, Ll/hm3$a;->a(Landroid/content/Context;Landroid/webkit/WebView;Ll/flw;Lorg/json/JSONObject;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 61
    .line 62
    return-void
.end method
