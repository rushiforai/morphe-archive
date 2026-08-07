.class final Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->f(Ljava/lang/String;I)V
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
    c = "com.hellogroup.mk.business.util.MKWebCaptureHelper$Companion$deleteCache$1"
    f = "MKWebCaptureHelper.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $type:I

.field final synthetic $url:Ljava/lang/String;

.field label:I

.field private p$:Ll/drb;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->$url:Ljava/lang/String;

    iput p2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->$type:I

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

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

    new-instance v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->$url:Ljava/lang/String;

    iget p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->$type:I

    invoke-direct {v0, v1, p0, p2}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;-><init>(Ljava/lang/String;ILkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->label:I

    .line 7
    .line 8
    if-nez v1, :cond_4

    .line 9
    .line 10
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->$url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Ll/i8g0;->b(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->Companion:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->e()V

    .line 24
    .line 25
    .line 26
    goto :goto_2

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    sget-object p1, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->Companion:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->$url:Ljava/lang/String;

    .line 32
    .line 33
    iget p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$deleteCache$1;->$type:I

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    if-eq p0, v2, :cond_1

    .line 39
    .line 40
    move-object p0, v0

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string p0, "2"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const-string p0, "1"

    .line 46
    .line 47
    :goto_0
    invoke-virtual {p1, v1, p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :goto_1
    const-string p1, "MKWebCaptureHelper"

    .line 64
    .line 65
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_4
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 72
    .line 73
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    return-object p0
.end method
