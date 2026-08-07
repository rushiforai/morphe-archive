.class public final Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$WebMonitor;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001&B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u0017\u0010\u0008\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\r\u0010\n\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\n\u0010\u0003J\r\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0016\u0010\u0010\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u000fR\u0016\u0010\u0014\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013R\u001e\u0010\u0018\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u001a\u001a\u00020\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u0013R$\u0010\"\u001a\u0004\u0018\u00010\u001b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001c\u0010\u001d\u001a\u0004\u0008\u001e\u0010\u001f\"\u0004\u0008 \u0010!R$\u0010%\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010\u000f\u001a\u0004\u0008\u001c\u0010#\"\u0004\u0008$\u0010\t\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;",
        "",
        "<init>",
        "()V",
        "",
        "g",
        "",
        "msg",
        "h",
        "(Ljava/lang/String;)V",
        "j",
        "Ll/grp0;",
        "i",
        "()Ll/grp0;",
        "a",
        "Ljava/lang/String;",
        "WEB_APM",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "b",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "mIsPrepared",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "c",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "mInjectContent",
        "d",
        "monitorEnable",
        "Ljava/text/SimpleDateFormat;",
        "e",
        "Ljava/text/SimpleDateFormat;",
        "f",
        "()Ljava/text/SimpleDateFormat;",
        "l",
        "(Ljava/text/SimpleDateFormat;)V",
        "TIME_FORMATTER",
        "()Ljava/lang/String;",
        "k",
        "NETWORK_TYPE",
        "WebMonitor",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;

.field public static a:Ljava/lang/String;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static volatile b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static c:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static e:Ljava/text/SimpleDateFormat;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static f:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->INSTANCE:Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;

    .line 7
    .line 8
    const-string v0, "webApm"

    .line 9
    .line 10
    sput-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->a:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 26
    .line 27
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    const-string v0, ""

    .line 35
    .line 36
    sput-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->f:Ljava/lang/String;

    .line 37
    .line 38
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

.method public static final synthetic a(Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final g()V
    .locals 6

    .line 1
    sget-object v0, Ll/l4k;->INSTANCE:Ll/l4k;

    .line 2
    .line 3
    invoke-static {}, Ll/r5e;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v3, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$initJsSdk$1;

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-direct {v3, p0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$initJsSdk$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 11
    .line 12
    .line 13
    const/4 v4, 0x2

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static final h(Ljava/lang/String;)V
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final e()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Ljava/text/SimpleDateFormat;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->e:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Ll/grp0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$WebMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$WebMonitor;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final j()V
    .locals 1

    .line 1
    invoke-static {}, Ll/sjw;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;->INSTANCE:Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-direct {p0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->g()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p1, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final l(Ljava/text/SimpleDateFormat;)V
    .locals 0
    .param p1    # Ljava/text/SimpleDateFormat;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p1, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->e:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    return-void
.end method
