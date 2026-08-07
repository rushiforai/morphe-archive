.class final Lcom/immomo/mmutil/task/Executors$isolatedExecutorInfo$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lcom/immomo/mmutil/task/Executors$ExecutorInfo;",
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
        "Lcom/immomo/mmutil/task/Executors$ExecutorInfo;",
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
.field public static final INSTANCE:Lcom/immomo/mmutil/task/Executors$isolatedExecutorInfo$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/immomo/mmutil/task/Executors$isolatedExecutorInfo$2;

    invoke-direct {v0}, Lcom/immomo/mmutil/task/Executors$isolatedExecutorInfo$2;-><init>()V

    sput-object v0, Lcom/immomo/mmutil/task/Executors$isolatedExecutorInfo$2;->INSTANCE:Lcom/immomo/mmutil/task/Executors$isolatedExecutorInfo$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lcom/immomo/mmutil/task/Executors$ExecutorInfo;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/immomo/mmutil/task/Executors$ExecutorInfo;

    .line 2
    .line 3
    const-string v0, "TYPE_ISOLATED"

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-direct {p0, v0, v1}, Lcom/immomo/mmutil/task/Executors$ExecutorInfo;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 10
    invoke-virtual {p0}, Lcom/immomo/mmutil/task/Executors$isolatedExecutorInfo$2;->invoke()Lcom/immomo/mmutil/task/Executors$ExecutorInfo;

    move-result-object p0

    return-object p0
.end method
