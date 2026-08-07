.class final Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo$threadExecutor$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo;-><init>(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ll/d2e0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0003\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0001\u0010\u0002"
    }
    d2 = {
        "Ll/d2e0;",
        "invoke",
        "()Ll/d2e0;",
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
.field final synthetic this$0:Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo;


# direct methods
.method public constructor <init>(Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo$threadExecutor$2;->this$0:Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo$threadExecutor$2;->invoke()Ll/d2e0;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ll/d2e0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/d2e0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo$threadExecutor$2;->this$0:Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo;->a(Lcom/immomo/mwc/sdk/utils/thread/Executors$ExecutorInfo;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-direct {v0, p0}, Ll/d2e0;-><init>(I)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
