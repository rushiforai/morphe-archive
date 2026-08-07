.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/drb;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0004\u001a\u00020\u0001*\u00020\u0000H\u008a@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Ll/drb;",
        "",
        "invoke",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hellogroup.mk.business.bridge.BusinessMediaBridge$runCommand$3"
    f = "BusinessMediaBridge.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $loadICallback:Ll/jxl;

.field final synthetic $params:Lorg/json/JSONObject;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ll/jxl;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->$loadICallback:Ll/jxl;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->$params:Lorg/json/JSONObject;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;

    iget-object v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iget-object v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->$loadICallback:Ll/jxl;

    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->$params:Lorg/json/JSONObject;

    invoke-direct {v0, v1, v2, p0, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ll/jxl;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->$loadICallback:Ll/jxl;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ijw;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;->$params:Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ll/ijw;-><init>(Lorg/json/JSONObject;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3$a;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3$a;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$runCommand$3;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0, v1, v2}, Ll/jxl;->b(Landroid/content/Context;Ll/ijw;Ll/kxl;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 38
    .line 39
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method
