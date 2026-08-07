.class final Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/common/thread/MThreadUtilsKt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ll/n510;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0003\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0001\u0010\u0002"
    }
    d2 = {
        "Ll/n510;",
        "invoke",
        "()Ll/n510;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2;

    invoke-direct {v0}, Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2;-><init>()V

    sput-object v0, Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2;->INSTANCE:Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 31
    invoke-virtual {p0}, Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2;->invoke()Ll/n510;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ll/n510;
    .locals 10
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/n510;

    .line 2
    .line 3
    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v8, Lcom/hellogroup/common/thread/a;

    .line 9
    .line 10
    invoke-direct {v8}, Lcom/hellogroup/common/thread/a;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v9, Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;->INSTANCE:Lcom/hellogroup/common/thread/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;

    .line 14
    .line 15
    const-string v1, "MMEIsolate"

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x2

    .line 19
    const-wide/16 v4, 0xa

    .line 20
    .line 21
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-direct/range {v0 .. v9}, Ll/n510;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method
