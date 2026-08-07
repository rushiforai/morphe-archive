.class final Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/core/log/core/MKLogReporter;->c(Ll/kkw;)V
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
    c = "com.hellogroup.mk.core.log.core.MKLogReporter$dispatchUpload$1"
    f = "MKLogReporter.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $event:Ll/kkw;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/core/log/core/MKLogReporter;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/core/log/core/MKLogReporter;Ll/kkw;Lkotlin/coroutines/Continuation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->this$0:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->$event:Ll/kkw;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance v0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;

    iget-object v1, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->this$0:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    iget-object p0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->$event:Ll/kkw;

    invoke-direct {v0, v1, p0, p2}, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;-><init>(Lcom/hellogroup/mk/core/log/core/MKLogReporter;Ll/kkw;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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
    iget v0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->this$0:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->a(Lcom/hellogroup/mk/core/log/core/MKLogReporter;)Ll/pkw;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->this$0:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;->$event:Ll/kkw;

    .line 22
    .line 23
    invoke-interface {p1, v0, p0}, Ll/pkw;->a(Lcom/hellogroup/mk/core/log/core/MKLogReporter;Ll/kkw;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method
