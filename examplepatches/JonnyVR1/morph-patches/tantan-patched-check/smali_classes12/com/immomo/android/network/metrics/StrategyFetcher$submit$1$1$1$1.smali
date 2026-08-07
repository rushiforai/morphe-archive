.class final Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->invoke(Ll/apl;Ll/vv5;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/lang/String;",
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
        "\u0000\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 10
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$1;->invoke()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1$1;->this$0:Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/android/network/metrics/StrategyFetcher$submit$1$1$1;->$strategyRef:Lcom/immomo/android/network/metrics/Strategy;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/Strategy;->u()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
