.class public final Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/ScheduledExecutorService;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;",
        "Ljava/util/concurrent/ScheduledExecutorService;",
        "Companion",
        "a",
        "mwc_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$a;

.field private static final a:Lkotlin/Lazy;

.field private static final b:Lkotlin/Lazy;

.field private static final c:Lkotlin/Lazy;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;->Companion:Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$a;

    .line 8
    .line 9
    sget-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$Companion$callableField$2;->INSTANCE:Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$Companion$callableField$2;

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;->a:Lkotlin/Lazy;

    .line 16
    .line 17
    sget-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$Companion$runnableAdapterClass$2;->INSTANCE:Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$Companion$runnableAdapterClass$2;

    .line 18
    .line 19
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;->b:Lkotlin/Lazy;

    .line 24
    .line 25
    sget-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$Companion$taskField$2;->INSTANCE:Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor$Companion$taskField$2;

    .line 26
    .line 27
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;->c:Lkotlin/Lazy;

    .line 32
    .line 33
    return-void
.end method

.method public static final synthetic k()Lkotlin/Lazy;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic m()Lkotlin/Lazy;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;->b:Lkotlin/Lazy;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic n()Lkotlin/Lazy;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/utils/thread/SafeExecutor;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    return-object v0
.end method
