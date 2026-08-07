.class final Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0010\u0005\u001a\u00020\u0001*\u00020\u0000H\u008a@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Ll/drb;",
        "",
        "invoke",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "com/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$1$1",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $drawable:Lkotlin/jvm/internal/Ref$ObjectRef;

.field final synthetic $file$inlined:Ljava/io/File;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/Ref$ObjectRef;Lkotlin/coroutines/Continuation;Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;Ljava/io/File;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->$drawable:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-object p3, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    iput-object p4, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->$file$inlined:Ljava/io/File;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

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

    new-instance v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->$drawable:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->$file$inlined:Ljava/io/File;

    invoke-direct {v0, v1, p2, v2, p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;Lkotlin/coroutines/Continuation;Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;Ljava/io/File;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
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
    iget v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->e(Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$cacheWeb:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->$drawable:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 38
    .line 39
    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$mkWebView:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setLoadedCapture(Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_2
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 58
    .line 59
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method
