.class public Lcom/idv/identity/service/IdentityFaceService;
.super Ll/cn2;
.source "SourceFile"


# static fields
.field public static final ASSET_FACE_DET_MNN:Ljava/lang/String; = "facedet_yolo.mnn"

.field public static final ASSET_FACE_QUALITY_SCORE:Ljava/lang/String; = "face_qualityscore.mnn"

.field private static final TAG:Ljava/lang/String; = "IdentityFaceService"

.field private static final desiredWidth:I = 0x1e0

.field private static totalDropFrame:J


# instance fields
.field private cacheContext:Landroid/content/Context;

.field private cacheRunnable:Ll/o4r0;

.field identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/gfm;",
            ">;"
        }
    .end annotation
.end field

.field public initResult:Z

.field private mCallbackThread:Landroid/os/HandlerThread;

.field private mCallbackThreadHandler:Landroid/os/Handler;

.field private mDebugToolIdentityFaceService:Ll/gfm;

.field private final mImageProcessing:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mProcessThread:Landroid/os/HandlerThread;

.field private mProcessThreadHandler:Landroid/os/Handler;

.field private final models:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ll/cn2;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mImageProcessing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThread:Landroid/os/HandlerThread;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    iput-boolean v1, p0, Lcom/idv/identity/service/IdentityFaceService;->initResult:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->models:Ljava/util/List;

    return-void
.end method

.method public static synthetic access$000(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Lcom/idv/identity/base/algorithm/IIdentityDelegate;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/idv/identity/service/IdentityFaceService;->configAndLoadModel(Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Lcom/idv/identity/base/algorithm/IIdentityDelegate;)V

    return-void
.end method

.method public static synthetic access$100(Lcom/idv/identity/service/IdentityFaceService;)Ll/gfm;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->mDebugToolIdentityFaceService:Ll/gfm;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/idv/identity/service/IdentityFaceService;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->mImageProcessing:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method private configAndLoadModel(Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Lcom/idv/identity/base/algorithm/IIdentityDelegate;)V
    .locals 4

    const-string v0, "com.idv.identity.quality.QualityRouter"

    invoke-static {v0}, Ll/ofm;->b(Ljava/lang/String;)Ll/dn2;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->models:Ljava/util/List;

    invoke-interface {v0}, Ll/dn2;->getModel()Ljava/util/List;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_0
    iput-boolean v1, p1, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->isOpenQualityCheck:Z

    :goto_0
    const-string v0, "com.idv.identity.blink.BlinkRouter"

    invoke-static {v0}, Ll/ofm;->b(Ljava/lang/String;)Ll/dn2;

    move-result-object v0

    const-string v2, ""

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/idv/identity/service/IdentityFaceService;->models:Ljava/util/List;

    invoke-interface {v0}, Ll/dn2;->getModel()Ljava/util/List;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_1
    iget-object v0, p1, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->livenessCombinations:Ljava/lang/String;

    const-string v3, "faceBlinkLiveness"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->livenessCombinations:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    :cond_2
    :goto_1
    const-string v0, "com.aliyun.identity.mouth.MouthRouter"

    invoke-static {v0}, Ll/ofm;->b(Ljava/lang/String;)Ll/dn2;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->models:Ljava/util/List;

    invoke-interface {v0}, Ll/dn2;->getModel()Ljava/util/List;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    :cond_3
    iget-object v0, p1, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->livenessCombinations:Ljava/lang/String;

    const-string v3, "OpenMouthLiveness"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p1, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->livenessCombinations:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->cacheContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->models:Ljava/util/List;

    invoke-virtual {p0, v0, v2}, Lcom/idv/identity/service/IdentityFaceService;->copyModelFromAssetsToData(Landroid/content/Context;Ljava/util/List;)Z

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Doc.init copyModelFromAssetsToData isSuc:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "IdentityFaceService"

    invoke-static {v3, v2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v3, 0x0

    if-nez v0, :cond_6

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ll/gfm;

    const-string v0, "INIT_LOAD_MODEL_ERROR"

    invoke-interface {p2, v0, v3}, Ll/gfm;->e(Ljava/lang/String;Ljava/util/Map;)Z

    goto :goto_3

    :cond_5
    iput-boolean v1, p0, Lcom/idv/identity/service/IdentityFaceService;->initResult:Z

    return-void

    :cond_6
    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll/gfm;

    const-string v2, "INIT_LOAD_MODEL_SUCCESS"

    invoke-interface {v1, v2, v3}, Ll/gfm;->e(Ljava/lang/String;Ljava/util/Map;)Z

    goto :goto_4

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/idv/identity/service/IdentityFaceService;->cacheContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "IdentityAlgConfig:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/idv/identity/base/algorithm/IdentityAlgConfig;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/o6r0;->a(Ljava/lang/String;)V

    invoke-static {p2, p1}, Lcom/idv/identity/service/algorithm/IdentityFace;->config(Lcom/idv/identity/base/algorithm/IIdentityDelegate;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;)V

    const/4 p1, 0x4

    invoke-static {v0, p1}, Lcom/idv/identity/service/algorithm/IdentityFace;->loadModelPath(Ljava/lang/String;I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/idv/identity/service/IdentityFaceService;->initResult:Z

    return-void
.end method

.method private setupWorkingThread()I
    .locals 4

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    const-string v1, "IdentityProcessQueue"

    if-nez v0, :cond_1

    const-wide/16 v2, 0xbb8

    invoke-static {v2, v3}, Ll/rxk;->e(J)V

    invoke-static {v1}, Ll/rxk;->c(Ljava/lang/String;)Landroid/os/HandlerThread;

    move-result-object v0

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v0

    sget-object v2, Ljava/lang/Thread$State;->NEW:Ljava/lang/Thread$State;

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_0
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_1

    const/4 p0, -0x1

    return p0

    :cond_1
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/rxk;->c(Ljava/lang/String;)Landroid/os/HandlerThread;

    move-result-object v0

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    :cond_2
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    :cond_3
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_4

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "IdentityCallbackQueue"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_4

    const/4 p0, -0x3

    return p0

    :cond_4
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    if-nez v0, :cond_5

    new-instance v0, Ll/dwq0;

    iget-object v1, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Ll/dwq0;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    :cond_5
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public config(Lcom/idv/identity/base/algorithm/IdentityAlgConfig;)Z
    .locals 2

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v1, Ll/txq0;

    invoke-direct {v1, p0, p1, p0}, Ll/txq0;-><init>(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Lcom/idv/identity/base/algorithm/IIdentityDelegate;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public copyModelFromAssetsToData(Landroid/content/Context;Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    const/4 p0, 0x0

    :try_start_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p1, v0}, Ll/jki;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_0

    return p0

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0

    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "IdentityFaceService"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/o6r0;->c(Ljava/lang/String;)V

    return p0
.end method

.method public finishPhotinus()V
    .locals 1

    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    if-eqz p0, :cond_0

    new-instance v0, Ll/muq0;

    invoke-direct {v0}, Ll/muq0;-><init>()V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public handleCaptureCompleted(ILjava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v1, Lcom/idv/identity/service/d;

    invoke-direct {v1, p0, p1, p2}, Lcom/idv/identity/service/d;-><init>(Lcom/idv/identity/service/IdentityFaceService;ILjava/util/Map;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public handleEventStated(I)V
    .locals 2

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/idv/identity/service/a;

    invoke-direct {v1, p0, p1}, Lcom/idv/identity/service/a;-><init>(Lcom/idv/identity/service/IdentityFaceService;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public handleInfoReady(Lcom/idv/identity/base/algorithm/IDFrame;)V
    .locals 2

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/idv/identity/service/b;

    invoke-direct {v1, p0, p1}, Lcom/idv/identity/service/b;-><init>(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IDFrame;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public handleStateUpdated(ILcom/idv/identity/base/algorithm/IdentityFaceAttr;)V
    .locals 2

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v1, Lcom/idv/identity/service/c;

    invoke-direct {v1, p0, p1, p2}, Lcom/idv/identity/service/c;-><init>(Lcom/idv/identity/service/IdentityFaceService;ILcom/idv/identity/base/algorithm/IdentityFaceAttr;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public init(Landroid/content/Context;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Ll/gfm;)Z
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/service/IdentityFaceService;->setupWorkingThread()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->models:Ljava/util/List;

    .line 10
    .line 11
    const-string v2, "facedet_yolo.mnn"

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->models:Ljava/util/List;

    .line 17
    .line 18
    const-string v2, "face_qualityscore.mnn"

    .line 19
    .line 20
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->cacheContext:Landroid/content/Context;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 30
    .line 31
    invoke-virtual {v0, p3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    const-string p3, "com.idv.identity.tools.DebugToolIdentityFaceService"

    .line 35
    .line 36
    const-class v0, Ll/gfm;

    .line 37
    .line 38
    invoke-static {p3, v0}, Ll/ofm;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    check-cast p3, Ll/gfm;

    .line 43
    .line 44
    iput-object p3, p0, Lcom/idv/identity/service/IdentityFaceService;->mDebugToolIdentityFaceService:Ll/gfm;

    .line 45
    .line 46
    if-eqz p3, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 49
    .line 50
    invoke-virtual {v0, p3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-static {p1}, Lcom/idv/identity/service/algorithm/IdentityFace;->loadLibrary(Landroid/content/Context;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput-boolean p1, p0, Lcom/idv/identity/service/IdentityFaceService;->initResult:Z

    .line 58
    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Ll/gfm;

    .line 78
    .line 79
    const-string p3, "INIT_LOAD_SO_ERROR"

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    invoke-interface {p2, p3, v0}, Ll/gfm;->e(Ljava/lang/String;Ljava/util/Map;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    iput-boolean v1, p0, Lcom/idv/identity/service/IdentityFaceService;->initResult:Z

    .line 87
    .line 88
    return v1

    .line 89
    :cond_3
    invoke-virtual {p0, p2}, Lcom/idv/identity/service/IdentityFaceService;->config(Lcom/idv/identity/base/algorithm/IdentityAlgConfig;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    return p0
.end method

.method public preProcess()V
    .locals 1

    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/gfm;

    invoke-interface {v0}, Ll/gfm;->preProcess()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public processImage(Lcom/idv/identity/base/algorithm/IDFrame;)Z
    .locals 4

    iget-boolean v0, p0, Lcom/idv/identity/service/IdentityFaceService;->initResult:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mImageProcessing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/idv/identity/service/IdentityFaceService;->cacheRunnable:Ll/o4r0;

    if-nez v3, :cond_0

    new-instance v3, Ll/l0r0;

    invoke-direct {v3, p0, p1}, Ll/l0r0;-><init>(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IDFrame;)V

    iput-object v3, p0, Lcom/idv/identity/service/IdentityFaceService;->cacheRunnable:Ll/o4r0;

    :cond_0
    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->cacheRunnable:Ll/o4r0;

    iput-object p1, p0, Ll/o4r0;->a:Lcom/idv/identity/base/algorithm/IDFrame;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    return v2

    :cond_1
    sget-wide p0, Lcom/idv/identity/service/IdentityFaceService;->totalDropFrame:J

    const-wide/16 v2, 0x1

    add-long/2addr p0, v2

    sput-wide p0, Lcom/idv/identity/service/IdentityFaceService;->totalDropFrame:J

    :cond_2
    :goto_0
    return v1
.end method

.method public registerIdentityFaceCallback(Ll/gfm;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 5

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iget-object v1, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    new-instance v3, Ll/qrq0;

    invoke-direct {v3, p0}, Ll/qrq0;-><init>(Lcom/idv/identity/service/IdentityFaceService;)V

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v1, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    :cond_0
    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    invoke-virtual {v0, v3, v4, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_1

    invoke-static {v0}, Ll/rxk;->d(Landroid/os/HandlerThread;)V

    iput-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThread:Landroid/os/HandlerThread;

    :cond_1
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iput-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThread:Landroid/os/HandlerThread;

    :cond_2
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;

    if-eqz v0, :cond_3

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->mCallbackThreadHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_3
    iget-object v0, p0, Lcom/idv/identity/service/IdentityFaceService;->mImageProcessing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iput-object v2, p0, Lcom/idv/identity/service/IdentityFaceService;->cacheRunnable:Ll/o4r0;

    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/idv/identity/service/IdentityFaceService;->totalDropFrame:J

    return-void
.end method

.method public removeIdentityFaceCallback(Ll/gfm;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public reset()V
    .locals 1

    iget-object p0, p0, Lcom/idv/identity/service/IdentityFaceService;->mProcessThreadHandler:Landroid/os/Handler;

    if-eqz p0, :cond_0

    new-instance v0, Ll/j4r0;

    invoke-direct {v0}, Ll/j4r0;-><init>()V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public setFarNeatAction(Z)Z
    .locals 0

    invoke-static {p1}, Lcom/idv/identity/service/algorithm/IdentityFace;->setFarNeatAction(Z)V

    return p1
.end method
