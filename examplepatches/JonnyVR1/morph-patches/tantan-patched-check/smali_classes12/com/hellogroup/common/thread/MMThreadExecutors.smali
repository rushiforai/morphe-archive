.class public final Lcom/hellogroup/common/thread/MMThreadExecutors;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001b\u0010\u0008\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0005\u0010\u0007R\u0011\u0010\u000c\u001a\u00020\t8F\u00a2\u0006\u0006\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/hellogroup/common/thread/MMThreadExecutors;",
        "",
        "<init>",
        "()V",
        "Ll/tl80;",
        "a",
        "Lkotlin/Lazy;",
        "()Ll/tl80;",
        "Main",
        "Ll/lxi0;",
        "b",
        "()Ll/lxi0;",
        "User",
        "HelloFoundation_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/common/thread/MMThreadExecutors;

.field private static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/common/thread/MMThreadExecutors;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/common/thread/MMThreadExecutors;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hellogroup/common/thread/MMThreadExecutors;->INSTANCE:Lcom/hellogroup/common/thread/MMThreadExecutors;

    .line 7
    .line 8
    sget-object v0, Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2;->INSTANCE:Lcom/hellogroup/common/thread/MMThreadExecutors$Main$2;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/hellogroup/common/thread/MMThreadExecutors;->a:Lkotlin/Lazy;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Ll/tl80;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/common/thread/MMThreadExecutors;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/tl80;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b()Ll/lxi0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/common/thread/Executors;->INSTANCE:Lcom/hellogroup/common/thread/Executors;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/common/thread/Executors;->a()Lcom/hellogroup/common/thread/Executors$ExecutorInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/common/thread/Executors$ExecutorInfo;->c()Ll/lxi0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
