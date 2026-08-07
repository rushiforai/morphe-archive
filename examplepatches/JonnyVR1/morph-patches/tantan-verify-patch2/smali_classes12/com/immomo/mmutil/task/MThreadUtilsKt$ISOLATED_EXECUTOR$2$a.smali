.class final Lcom/immomo/mmutil/task/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/RejectedExecutionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mmutil/task/MThreadUtilsKt$ISOLATED_EXECUTOR$2;->invoke()Ll/k510;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u00032\u000e\u0010\u0005\u001a\n \u0004*\u0004\u0018\u00010\u00060\u0006H\n\u00a2\u0006\u0002\u0008\u0007"
    }
    d2 = {
        "<anonymous>",
        "",
        "<anonymous parameter 0>",
        "Ljava/lang/Runnable;",
        "kotlin.jvm.PlatformType",
        "<anonymous parameter 1>",
        "Ljava/util/concurrent/ThreadPoolExecutor;",
        "rejectedExecution"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/mmutil/task/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/immomo/mmutil/task/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;

    invoke-direct {v0}, Lcom/immomo/mmutil/task/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;-><init>()V

    sput-object v0, Lcom/immomo/mmutil/task/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;->INSTANCE:Lcom/immomo/mmutil/task/MThreadUtilsKt$ISOLATED_EXECUTOR$2$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final rejectedExecution(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 0

    return-void
.end method
