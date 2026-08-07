.class final Lcom/hellogroup/fep/base/FepContext$pollTimer$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/fep/base/FepContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lcom/hellogroup/common/timer/ControllableTimer;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Lcom/hellogroup/common/timer/ControllableTimer;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/fep/base/FepContext$pollTimer$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/fep/base/FepContext$pollTimer$2;

    invoke-direct {v0}, Lcom/hellogroup/fep/base/FepContext$pollTimer$2;-><init>()V

    sput-object v0, Lcom/hellogroup/fep/base/FepContext$pollTimer$2;->INSTANCE:Lcom/hellogroup/fep/base/FepContext$pollTimer$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lcom/hellogroup/common/timer/ControllableTimer;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/hellogroup/common/timer/ControllableTimer;

    .line 2
    .line 3
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/drb;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, v0}, Lcom/hellogroup/common/timer/ControllableTimer;-><init>(Lkotlin/coroutines/CoroutineContext;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 17
    invoke-virtual {p0}, Lcom/hellogroup/fep/base/FepContext$pollTimer$2;->invoke()Lcom/hellogroup/common/timer/ControllableTimer;

    move-result-object p0

    return-object p0
.end method
