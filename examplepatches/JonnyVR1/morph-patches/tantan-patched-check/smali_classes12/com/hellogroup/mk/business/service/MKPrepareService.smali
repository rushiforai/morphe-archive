.class public Lcom/hellogroup/mk/business/service/MKPrepareService;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "MDLogUse"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MKPrepareService"

.field private static extraRunnableList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private isRunning:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/service/MKPrepareService;->isRunning:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic access$000()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/service/MKPrepareService;->extraRunnableList:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$002(Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    sput-object p0, Lcom/hellogroup/mk/business/service/MKPrepareService;->extraRunnableList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/hellogroup/mk/business/service/MKPrepareService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/service/MKPrepareService;->onPrepareFinished()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private onPrepareFinished()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/service/MKPrepareService;->isRunning:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static prepare(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    sput-object p1, Lcom/hellogroup/mk/business/service/MKPrepareService;->extraRunnableList:Ljava/util/List;

    .line 2
    .line 3
    :try_start_0
    new-instance p1, Landroid/content/Intent;

    .line 4
    .line 5
    const-string v0, "com.immomo.momo.prepare_mk"

    .line 6
    .line 7
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    const-string p1, "MKPrepareService"

    .line 23
    .line 24
    const-string v0, ""

    .line 25
    .line 26
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private startPrepare()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/service/MKPrepareService;->isRunning:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/service/MKPrepareService;->isRunning:Z

    .line 7
    .line 8
    new-instance v1, Lcom/hellogroup/mk/business/service/MKPrepareService$a;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/service/MKPrepareService$a;-><init>(Lcom/hellogroup/mk/business/service/MKPrepareService;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-direct {p0}, Lcom/hellogroup/mk/business/service/MKPrepareService;->onPrepareFinished()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/service/MKPrepareService;->startPrepare()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    return p0
.end method
