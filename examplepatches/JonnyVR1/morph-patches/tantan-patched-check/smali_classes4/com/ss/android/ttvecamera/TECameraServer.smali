.class public final enum Lcom/ss/android/ttvecamera/TECameraServer;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/TECameraServer$b1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/android/ttvecamera/TECameraServer;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/android/ttvecamera/TECameraServer;

.field public static final enum INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

.field private static final TAG:Ljava/lang/String; = "TECameraServer"


# instance fields
.field private cachedClosePrivacyCert:Lcom/bytedance/bpea/basics/Cert;

.field private cachedOpenPrivacyCert:Lcom/bytedance/bpea/basics/Cert;

.field private final mBasePreviewSizeCallback:Lcom/ss/android/ttvecamera/c$e;

.field private mBeginTime:J

.field private mCameraClient:Lcom/ss/android/ttvecamera/d;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mCameraClientCondition:Landroid/os/ConditionVariable;

.field private mCameraCloseTaskHandlerId:I

.field private mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

.field private volatile mCameraInstance:Lcom/ss/android/ttvecamera/c;

.field private mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

.field private mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

.field private mCheckCloseTask:Ljava/lang/Runnable;

.field private volatile mCurrentCameraState:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mStateLock"
    .end annotation
.end field

.field private mCurrentZoom:F

.field private mEnableVBoost:Z

.field private mFirstEC:Z

.field private mFirstZoom:Z

.field private mFpsConfigCallback:Lcom/ss/android/ttvecamera/d$a;

.field private final mFpsConfigCallbackProxy:Lcom/ss/android/ttvecamera/c$b;

.field private mHandler:Landroid/os/Handler;

.field private volatile mHandlerDestroyed:Z

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private volatile mIsCameraPendingClose:Z

.field private volatile mIsCameraProviderChanged:Z

.field private volatile mIsCameraSwitchState:Z

.field private mIsForegroundVisible:Z

.field private volatile mIsInitialized:Z

.field private final mLock:Ljava/lang/Object;

.field private mMainHandler:Landroid/os/Handler;

.field private mOnBackGround:Z

.field private final mOpenInfoMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mOpenTime:J

.field private final mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

.field private mPictureSizeCallback:Lcom/ss/android/ttvecamera/d$d;

.field private mPreviewSizeCallback:Lcom/ss/android/ttvecamera/d$e;

.field mProviderManager:Ll/jrh0;

.field private mProviderSettings:Ll/jrh0$a;

.field private mRetryCnt:I

.field private mSATZoomCallback:Lcom/ss/android/ttvecamera/TECameraSettings$m;

.field private mStartPreviewError:Z

.field private final mStateLock:Ljava/lang/Object;

.field private mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

.field private mVBoostTimeoutMS:I

.field private volatile sClientCount:I
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private satZoomCallback:Lcom/ss/android/ttvecamera/c$f;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    const-string v1, "INSTANCE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/ss/android/ttvecamera/TECameraServer;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 10
    .line 11
    filled-new-array {v0}, [Lcom/ss/android/ttvecamera/TECameraServer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->$VALUES:[Lcom/ss/android/ttvecamera/TECameraServer;

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerDestroyed:Z

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentZoom:F

    .line 9
    .line 10
    new-instance p2, Lcom/ss/android/ttvecamera/d$c;

    .line 11
    .line 12
    invoke-direct {p2}, Lcom/ss/android/ttvecamera/d$c;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPreviewSizeCallback:Lcom/ss/android/ttvecamera/d$e;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 29
    .line 30
    new-instance v1, Ljava/lang/Object;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mLock:Ljava/lang/Object;

    .line 36
    .line 37
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 38
    .line 39
    const-wide/16 v1, 0x0

    .line 40
    .line 41
    iput-wide v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOpenTime:J

    .line 42
    .line 43
    iput-wide v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mBeginTime:J

    .line 44
    .line 45
    const/4 v1, -0x1

    .line 46
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 47
    .line 48
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStartPreviewError:Z

    .line 49
    .line 50
    new-instance v2, Landroid/os/ConditionVariable;

    .line 51
    .line 52
    invoke-direct {v2}, Landroid/os/ConditionVariable;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 56
    .line 57
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 58
    .line 59
    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOpenInfoMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 63
    .line 64
    new-instance v2, Landroid/os/Handler;

    .line 65
    .line 66
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 71
    .line 72
    .line 73
    iput-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mMainHandler:Landroid/os/Handler;

    .line 74
    .line 75
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedOpenPrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 76
    .line 77
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedClosePrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 78
    .line 79
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOnBackGround:Z

    .line 80
    .line 81
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstEC:Z

    .line 82
    .line 83
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstZoom:Z

    .line 84
    .line 85
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mEnableVBoost:Z

    .line 86
    .line 87
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mVBoostTimeoutMS:I

    .line 88
    .line 89
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsForegroundVisible:Z

    .line 90
    .line 91
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraCloseTaskHandlerId:I

    .line 92
    .line 93
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraSwitchState:Z

    .line 94
    .line 95
    new-instance p1, Lcom/ss/android/ttvecamera/TECameraServer$n0;

    .line 96
    .line 97
    invoke-direct {p1, p0}, Lcom/ss/android/ttvecamera/TECameraServer$n0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 101
    .line 102
    new-instance p1, Lcom/ss/android/ttvecamera/TECameraServer$o0;

    .line 103
    .line 104
    invoke-direct {p1, p0}, Lcom/ss/android/ttvecamera/TECameraServer$o0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFpsConfigCallbackProxy:Lcom/ss/android/ttvecamera/c$b;

    .line 108
    .line 109
    new-instance p1, Lcom/ss/android/ttvecamera/TECameraServer$p0;

    .line 110
    .line 111
    invoke-direct {p1, p0}, Lcom/ss/android/ttvecamera/TECameraServer$p0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 115
    .line 116
    new-instance p1, Lcom/ss/android/ttvecamera/TECameraServer$q0;

    .line 117
    .line 118
    invoke-direct {p1, p0}, Lcom/ss/android/ttvecamera/TECameraServer$q0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mBasePreviewSizeCallback:Lcom/ss/android/ttvecamera/c$e;

    .line 122
    .line 123
    new-instance p1, Lcom/ss/android/ttvecamera/TECameraServer$s0;

    .line 124
    .line 125
    invoke-direct {p1, p0}, Lcom/ss/android/ttvecamera/TECameraServer$s0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 126
    .line 127
    .line 128
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->satZoomCallback:Lcom/ss/android/ttvecamera/c$f;

    .line 129
    .line 130
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer;->open(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1000(Lcom/ss/android/ttvecamera/TECameraServer;ZLcom/bytedance/bpea/basics/Cert;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->close(ZLcom/bytedance/bpea/basics/Cert;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1100(Lcom/ss/android/ttvecamera/TECameraServer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraPendingClose:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1102(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraPendingClose:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1400(Lcom/ss/android/ttvecamera/TECameraServer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstEC:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1402(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstEC:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1500(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1600(Lcom/ss/android/ttvecamera/TECameraServer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOpenTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1602(Lcom/ss/android/ttvecamera/TECameraServer;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOpenTime:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$1700(Lcom/ss/android/ttvecamera/TECameraServer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mBeginTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1810(Lcom/ss/android/ttvecamera/TECameraServer;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOpenInfoMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedOpenPrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2100(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2200(Lcom/ss/android/ttvecamera/TECameraServer;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->isCameraPermitted()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$2300(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->close(Lcom/bytedance/bpea/basics/Cert;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$2402(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStartPreviewError:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$2500(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2600(Lcom/ss/android/ttvecamera/TECameraServer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->handlePreviewingFallback()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2700(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic access$2800(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$d;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic access$2900(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPreviewSizeCallback:Lcom/ss/android/ttvecamera/d$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$3000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings$m;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic access$302(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/c;)Lcom/ss/android/ttvecamera/c;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$3100(Lcom/ss/android/ttvecamera/TECameraServer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstZoom:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3102(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstZoom:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedClosePrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/bytedance/bpea/basics/Cert;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->realCloseCamera(Lcom/bytedance/bpea/basics/Cert;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/ss/android/ttvecamera/TECameraServer;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->decreaseClientCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$700(Lcom/ss/android/ttvecamera/TECameraServer;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->destroy()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$800(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mMainHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/ConditionVariable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 2
    .line 3
    return-object p0
.end method

.method private assertClient(Lcom/ss/android/ttvecamera/d;)Z
    .locals 3

    .line 1
    const-string v0, "Invalid CameraClient, need : "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 7
    .line 8
    if-eq v2, p1, :cond_1

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    const-string p0, "TECameraServer"

    .line 13
    .line 14
    const-string p1, "Internal CameraClient is null. Must call connect first!"

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const-string p1, "TECameraServer"

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 30
    .line 31
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    const/4 p0, 0x0

    .line 42
    monitor-exit v1

    .line 43
    return p0

    .line 44
    :cond_1
    monitor-exit v1

    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0
.end method

.method private close(Lcom/bytedance/bpea/basics/Cert;)I
    .locals 1

    const/4 v0, 0x1

    .line 270
    invoke-direct {p0, v0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->close(ZLcom/bytedance/bpea/basics/Cert;)I

    move-result p0

    return p0
.end method

.method private close(ZLcom/bytedance/bpea/basics/Cert;)I
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, -0x1

    .line 6
    const-string v4, "TECameraServer"

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraCloseTaskHandlerId:I

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p1, "call camera close process, handler is null"

    .line 20
    .line 21
    invoke-static {v4, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedClosePrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/ss/android/ttvecamera/c;->n(Lcom/bytedance/bpea/basics/Cert;)V

    .line 29
    .line 30
    .line 31
    const-string p1, "call camera close process, handler is null, force close done"

    .line 32
    .line 33
    invoke-static {v4, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 37
    .line 38
    .line 39
    const/16 p0, -0x70

    .line 40
    .line 41
    return p0

    .line 42
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v6, "call camera close process...sync: "

    .line 45
    .line 46
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v6, ", handler: "

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-static {v4, v5}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-boolean v5, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerDestroyed:Z

    .line 68
    .line 69
    if-nez v5, :cond_6

    .line 70
    .line 71
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    if-eq v5, v6, :cond_6

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    iget v6, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraCloseTaskHandlerId:I

    .line 86
    .line 87
    if-eq v6, v3, :cond_2

    .line 88
    .line 89
    if-eq v6, v5, :cond_2

    .line 90
    .line 91
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraCloseTaskHandlerId:I

    .line 92
    .line 93
    const-string p0, "camera close task discard...handler id has changed"

    .line 94
    .line 95
    invoke-static {v4, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return v2

    .line 99
    :cond_2
    iput v5, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraCloseTaskHandlerId:I

    .line 100
    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 102
    .line 103
    .line 104
    move-result-wide v7

    .line 105
    if-eqz p1, :cond_3

    .line 106
    .line 107
    iget-object v5, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 108
    .line 109
    invoke-virtual {v5}, Landroid/os/ConditionVariable;->close()V

    .line 110
    .line 111
    .line 112
    :cond_3
    const/4 v5, 0x1

    .line 113
    iput-boolean v5, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraPendingClose:Z

    .line 114
    .line 115
    new-instance v5, Lcom/ss/android/ttvecamera/TECameraServer$a;

    .line 116
    .line 117
    move-object v6, p0

    .line 118
    move v9, p1

    .line 119
    move-object v10, p2

    .line 120
    invoke-direct/range {v5 .. v10}, Lcom/ss/android/ttvecamera/TECameraServer$a;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;JZLcom/bytedance/bpea/basics/Cert;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 124
    .line 125
    .line 126
    if-eqz v9, :cond_8

    .line 127
    .line 128
    const-wide/16 p0, 0x5dc

    .line 129
    .line 130
    iget-object p2, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 131
    .line 132
    invoke-virtual {p2, p0, p1}, Landroid/os/ConditionVariable;->block(J)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    iput-boolean v2, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraPendingClose:Z

    .line 137
    .line 138
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 139
    .line 140
    .line 141
    move-result-wide p1

    .line 142
    sub-long/2addr p1, v7

    .line 143
    if-nez p0, :cond_5

    .line 144
    .line 145
    iput v3, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraCloseTaskHandlerId:I

    .line 146
    .line 147
    new-instance p0, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    const-string p1, "Camera close timeout, mCurrentCameraState "

    .line 150
    .line 151
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    iget p1, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 155
    .line 156
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {v4, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v6, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 167
    .line 168
    .line 169
    iget-object p0, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 170
    .line 171
    if-eqz p0, :cond_4

    .line 172
    .line 173
    iget-object p0, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 174
    .line 175
    iget-object p1, v6, Lcom/ss/android/ttvecamera/TECameraServer;->cachedClosePrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 176
    .line 177
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/c;->n(Lcom/bytedance/bpea/basics/Cert;)V

    .line 178
    .line 179
    .line 180
    :cond_4
    invoke-virtual {v6, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v0, "Camera close cost: "

    .line 187
    .line 188
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    const-string p1, "ms"

    .line 195
    .line 196
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-static {v4, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    goto :goto_1

    .line 207
    :cond_6
    move-object v6, p0

    .line 208
    move v9, p1

    .line 209
    move-object v10, p2

    .line 210
    iput v3, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraCloseTaskHandlerId:I

    .line 211
    .line 212
    iget-boolean p0, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mEnableVBoost:Z

    .line 213
    .line 214
    if-eqz p0, :cond_7

    .line 215
    .line 216
    iget-object p0, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 217
    .line 218
    new-instance p1, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;

    .line 219
    .line 220
    sget-object p2, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;->BOOST_CPU:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 221
    .line 222
    iget v0, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mVBoostTimeoutMS:I

    .line 223
    .line 224
    invoke-direct {p1, p2, v0}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;-><init>(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;I)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->c(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;)V

    .line 228
    .line 229
    .line 230
    invoke-direct {v6, v10}, Lcom/ss/android/ttvecamera/TECameraServer;->realCloseCamera(Lcom/bytedance/bpea/basics/Cert;)V

    .line 231
    .line 232
    .line 233
    iget-object p0, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 234
    .line 235
    new-instance p1, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;

    .line 236
    .line 237
    sget-object p2, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;->RESTORE_CPU:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 238
    .line 239
    invoke-direct {p1, p2}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;-><init>(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->c(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;)V

    .line 243
    .line 244
    .line 245
    goto :goto_0

    .line 246
    :cond_7
    invoke-direct {v6, v10}, Lcom/ss/android/ttvecamera/TECameraServer;->realCloseCamera(Lcom/bytedance/bpea/basics/Cert;)V

    .line 247
    .line 248
    .line 249
    :goto_0
    iget-object p0, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mMainHandler:Landroid/os/Handler;

    .line 250
    .line 251
    iget-object p1, v6, Lcom/ss/android/ttvecamera/TECameraServer;->mCheckCloseTask:Ljava/lang/Runnable;

    .line 252
    .line 253
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 254
    .line 255
    .line 256
    if-nez v9, :cond_8

    .line 257
    .line 258
    invoke-direct {v6}, Lcom/ss/android/ttvecamera/TECameraServer;->decreaseClientCount()I

    .line 259
    .line 260
    .line 261
    move-result p0

    .line 262
    if-nez p0, :cond_8

    .line 263
    .line 264
    invoke-direct {v6}, Lcom/ss/android/ttvecamera/TECameraServer;->destroy()I

    .line 265
    .line 266
    .line 267
    move-result p0

    .line 268
    return p0

    .line 269
    :cond_8
    :goto_1
    return v2
.end method

.method private createCameraInstance()Lcom/ss/android/ttvecamera/c;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->createCameraInstanceCore()Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPreviewSizeCallback:Lcom/ss/android/ttvecamera/d$e;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mBasePreviewSizeCallback:Lcom/ss/android/ttvecamera/c$e;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object p0, v2

    .line 16
    :goto_0
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/c;->c0(Lcom/ss/android/ttvecamera/c$e;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Lcom/ss/android/ttvecamera/c;->b0(Lcom/ss/android/ttvecamera/c$b;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-object v0
.end method

.method private createCameraInstanceCore()Lcom/ss/android/ttvecamera/c;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->s0:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/ss/android/ttvecamera/f;->u(Landroid/content/Context;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    move v0, v2

    .line 20
    :goto_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 21
    .line 22
    iget v4, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 23
    .line 24
    if-ne v4, v2, :cond_2

    .line 25
    .line 26
    iget-object v0, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 33
    .line 34
    invoke-static {v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/a;->N0(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_2
    const/16 v3, 0xa

    .line 40
    .line 41
    const/4 v9, 0x2

    .line 42
    if-eq v3, v4, :cond_3

    .line 43
    .line 44
    const/16 v3, 0xb

    .line 45
    .line 46
    if-ne v3, v4, :cond_6

    .line 47
    .line 48
    :cond_3
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 49
    .line 50
    const/16 v5, 0x1c

    .line 51
    .line 52
    if-lt v3, v5, :cond_6

    .line 53
    .line 54
    iget-object v5, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 55
    .line 56
    iget-object v6, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 57
    .line 58
    iget-object v7, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 59
    .line 60
    iget-object v8, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 61
    .line 62
    const-string v3, "com.ss.android.ttvecamera.TEVendorCamera"

    .line 63
    .line 64
    invoke-static/range {v3 .. v8}, Lcom/ss/android/ttvecamera/f;->j(Ljava/lang/String;ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lcom/ss/android/ttvecamera/c;

    .line 69
    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    const-string p0, "TECameraServer"

    .line 73
    .line 74
    const-string v0, "createCameraInstance TEVendorCamera"

    .line 75
    .line 76
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-object v1

    .line 80
    :cond_4
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 81
    .line 82
    if-nez v0, :cond_5

    .line 83
    .line 84
    iput v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 85
    .line 86
    iget-object v0, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 89
    .line 90
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 93
    .line 94
    invoke-static {v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/a;->N0(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_5
    iput v9, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 100
    .line 101
    iget-object v0, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 104
    .line 105
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 108
    .line 109
    invoke-static {v9, v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/b;->Q0(ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/b;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :cond_6
    if-nez v0, :cond_7

    .line 115
    .line 116
    iput v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 117
    .line 118
    iget-object v0, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 121
    .line 122
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 125
    .line 126
    invoke-static {v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/a;->N0(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0

    .line 131
    :cond_7
    iget-object v5, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 132
    .line 133
    iget-object v6, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 134
    .line 135
    iget-object v7, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 136
    .line 137
    iget-object v8, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 138
    .line 139
    move-object v3, p0

    .line 140
    invoke-direct/range {v3 .. v8}, Lcom/ss/android/ttvecamera/TECameraServer;->createVendorCamera2Instance(ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/c;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    if-nez p0, :cond_8

    .line 145
    .line 146
    iget-object p0, v3, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 147
    .line 148
    iput v9, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 149
    .line 150
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 151
    .line 152
    iget-object v0, v3, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 153
    .line 154
    iget-object v1, v3, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 155
    .line 156
    iget-object v2, v3, Lcom/ss/android/ttvecamera/TECameraServer;->mPictureSizeCallBack:Lcom/ss/android/ttvecamera/c$d;

    .line 157
    .line 158
    invoke-static {v9, p0, v0, v1, v2}, Lcom/ss/android/ttvecamera/b;->Q0(ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/b;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    :cond_8
    return-object p0
.end method

.method private createHandler(ZLjava/lang/String;)Landroid/os/Handler;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    :try_start_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerThread:Landroid/os/HandlerThread;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance p1, Landroid/os/HandlerThread;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$m0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer$m0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/os/Looper;->setMessageLogging(Landroid/util/Printer;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerThread:Landroid/os/HandlerThread;

    .line 31
    .line 32
    new-instance p2, Landroid/os/Handler;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$b1;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer$b1;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p2, p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-object p2

    .line 47
    :catch_0
    move-exception p0

    .line 48
    new-instance p1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p2, "CreateHandler failed!: "

    .line 51
    .line 52
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "TECameraServer"

    .line 67
    .line 68
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    new-instance p0, Landroid/os/Handler;

    .line 72
    .line 73
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-eqz p1, :cond_2

    .line 78
    .line 79
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    goto :goto_0

    .line 84
    :cond_2
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    :goto_0
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 89
    .line 90
    .line 91
    return-object p0
.end method

.method private createMessage(IZLandroid/os/Handler;)Landroid/os/Message;
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3, p1}, Landroid/os/Handler;->hasMessages(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p3, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Landroid/os/Message;

    .line 13
    .line 14
    invoke-direct {p0}, Landroid/os/Message;-><init>()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_0
    iput p1, p0, Landroid/os/Message;->what:I

    .line 23
    .line 24
    return-object p0
.end method

.method private createVendorCamera2Instance(ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/c;
    .locals 7
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const/4 p0, 0x4

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const-string p0, "com.ss.android.ttvecamera.TEOpMediaCamera"

    .line 6
    .line 7
    :goto_0
    move-object v1, p0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/4 p0, 0x6

    .line 10
    if-ne p1, p0, :cond_1

    .line 11
    .line 12
    const-string p0, "com.ss.android.ttvecamera.TEVoCamera"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/16 p0, 0x8

    .line 16
    .line 17
    if-ne p1, p0, :cond_2

    .line 18
    .line 19
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 20
    .line 21
    const/16 v1, 0x1c

    .line 22
    .line 23
    if-lt p0, v1, :cond_2

    .line 24
    .line 25
    const-string p0, "com.ss.android.ttvecamera.TEXmV2Camera"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    const/16 p0, 0x9

    .line 29
    .line 30
    if-ne p1, p0, :cond_3

    .line 31
    .line 32
    const-string p0, "com.ss.android.ttvecamera.TEOpCamera"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_3
    move-object v1, v0

    .line 36
    :goto_1
    if-eqz v1, :cond_4

    .line 37
    .line 38
    move v2, p1

    .line 39
    move-object v3, p2

    .line 40
    move-object v4, p3

    .line 41
    move-object v5, p4

    .line 42
    move-object v6, p5

    .line 43
    invoke-static/range {v1 .. v6}, Lcom/ss/android/ttvecamera/f;->j(Ljava/lang/String;ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/ss/android/ttvecamera/b;

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string p2, "create, vendorCamera2 = "

    .line 52
    .line 53
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string p2, "TECameraServer"

    .line 64
    .line 65
    invoke-static {p2, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_4
    return-object v0
.end method

.method private declared-synchronized decreaseClientCount()I
    .locals 4

    .line 1
    const-string v0, "Invalid ClientCount = "

    .line 2
    .line 3
    const-string v1, "sClientCount = "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 7
    .line 8
    add-int/lit8 v2, v2, -0x1

    .line 9
    .line 10
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 11
    .line 12
    const-string v2, "TECameraServer"

    .line 13
    .line 14
    new-instance v3, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 20
    .line 21
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 32
    .line 33
    if-gez v1, :cond_0

    .line 34
    .line 35
    const-string v1, "TECameraServer"

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 43
    .line 44
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    :goto_0
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    monitor-exit p0

    .line 63
    return v0

    .line 64
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw v0
.end method

.method private declared-synchronized destroy()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "TECameraServer"

    .line 3
    .line 4
    const-string v1, "destroy...start"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsInitialized:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCheckCloseTask:Ljava/lang/Runnable;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPreviewSizeCallback:Lcom/ss/android/ttvecamera/d$e;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedClosePrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedOpenPrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 22
    .line 23
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderSettings:Ll/jrh0$a;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/c;->i()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    new-instance v3, Lcom/ss/android/ttvecamera/TECameraServer$k;

    .line 42
    .line 43
    invoke-direct {v3, p0}, Lcom/ss/android/ttvecamera/TECameraServer$k;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerThread:Landroid/os/HandlerThread;

    .line 50
    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerThread:Landroid/os/HandlerThread;

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerDestroyed:Z

    .line 60
    .line 61
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 62
    .line 63
    :cond_2
    invoke-static {}, Lcom/ss/android/ttvecamera/d$c;->a()Lcom/ss/android/ttvecamera/d$c;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 68
    .line 69
    const-string v1, "TECameraServer"

    .line 70
    .line 71
    const-string v2, "destroy...end"

    .line 72
    .line 73
    invoke-static {v1, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .line 75
    .line 76
    monitor-exit p0

    .line 77
    return v0

    .line 78
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    throw v0
.end method

.method private handlePreviewingFallback()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 13
    .line 14
    const/4 v3, 0x3

    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x0

    .line 17
    if-ne v2, v3, :cond_2

    .line 18
    .line 19
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 20
    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/c;->x0()V

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x4

    .line 29
    invoke-virtual {p0, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedOpenPrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Lcom/ss/android/ttvecamera/c;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 37
    .line 38
    .line 39
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 40
    .line 41
    invoke-virtual {p0, v5}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_3

    .line 47
    :cond_1
    :goto_0
    move v2, v1

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move v2, v5

    .line 50
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    if-eqz v2, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 54
    .line 55
    iput v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 56
    .line 57
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 58
    .line 59
    const/16 v1, 0x33

    .line 60
    .line 61
    const-string v2, "need recreate surfacetexture"

    .line 62
    .line 63
    invoke-interface {v0, v1, v5, v2, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedOpenPrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 73
    .line 74
    invoke-direct {v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->open(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_2
    return-void

    .line 78
    :goto_3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    throw p0
.end method

.method private declared-synchronized increaseClientCount()I
    .locals 3

    .line 1
    const-string v0, "sClientCount = "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 5
    .line 6
    add-int/lit8 v1, v1, 0x1

    .line 7
    .line 8
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 9
    .line 10
    const-string v1, "TECameraServer"

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->sClientCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw v0
.end method

.method private declared-synchronized init(Z)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "TECameraServer"

    .line 3
    .line 4
    const-string v1, "init...start"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_1
    const-string v0, "TECameraServer"

    .line 16
    .line 17
    invoke-direct {p0, p1, v0}, Lcom/ss/android/ttvecamera/TECameraServer;->createHandler(ZLjava/lang/String;)Landroid/os/Handler;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerDestroyed:Z

    .line 25
    .line 26
    new-instance v0, Ll/jrh0;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/jrh0;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderManager:Ll/jrh0;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsInitialized:Z

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentZoom:F

    .line 38
    .line 39
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOnBackGround:Z

    .line 40
    .line 41
    new-instance p1, Landroid/os/Handler;

    .line 42
    .line 43
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mMainHandler:Landroid/os/Handler;

    .line 51
    .line 52
    new-instance p1, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 53
    .line 54
    invoke-direct {p1}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 58
    .line 59
    const-string p1, "TECameraServer"

    .line 60
    .line 61
    const-string v0, "init...end"

    .line 62
    .line 63
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    .line 65
    .line 66
    monitor-exit p0

    .line 67
    return-void

    .line 68
    :catchall_0
    move-exception p1

    .line 69
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 70
    throw p1
.end method

.method private isARConfigNotEqual(Lcom/ss/android/ttvecamera/TECameraSettings;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    const/4 v4, 0x0

    .line 11
    if-ne v2, v3, :cond_4

    .line 12
    .line 13
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->a:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$AugmentedFaceMode;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->a:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$AugmentedFaceMode;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-ne v0, v2, :cond_3

    .line 33
    .line 34
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->b:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$CloudAnchorMode;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->b:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$CloudAnchorMode;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-ne v0, v2, :cond_3

    .line 53
    .line 54
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->c:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$DepthMode;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->c:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$DepthMode;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-ne v0, v2, :cond_3

    .line 73
    .line 74
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->d:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$FocusMode;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 85
    .line 86
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->d:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$FocusMode;

    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-ne v0, v2, :cond_3

    .line 93
    .line 94
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->e:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$LightEstimationMode;

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget-object v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->e:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$LightEstimationMode;

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-ne v0, v2, :cond_3

    .line 113
    .line 114
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->f:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$PlaneFindingMode;

    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;->f:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig$PlaneFindingMode;

    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eq p0, p1, :cond_2

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_2
    return v4

    .line 136
    :cond_3
    :goto_0
    return v1

    .line 137
    :cond_4
    return v4
.end method

.method private isCameraPermitted()Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 3
    .line 4
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 5
    .line 6
    const-string v2, "android.permission.CAMERA"

    .line 7
    .line 8
    invoke-static {v1, v2}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v1

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "test camera permission failed!: "

    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "TECameraServer"

    .line 37
    .line 38
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOpenInfoMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v3, "CamPerm"

    .line 46
    .line 47
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 51
    .line 52
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, p0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    return v0
.end method

.method private onlySwitchSession(Lcom/ss/android/ttvecamera/TECameraSettings;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget v1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 14
    .line 15
    const/16 v2, 0xb

    .line 16
    .line 17
    if-ne v1, v2, :cond_0

    .line 18
    .line 19
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 20
    .line 21
    if-ne v1, v2, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 24
    .line 25
    iget v2, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 26
    .line 27
    iget-object v3, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 28
    .line 29
    iget v4, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 30
    .line 31
    if-ne v2, v4, :cond_0

    .line 32
    .line 33
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 34
    .line 35
    iget v2, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 36
    .line 37
    if-ne v1, v2, :cond_0

    .line 38
    .line 39
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->N:I

    .line 40
    .line 41
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->N:I

    .line 42
    .line 43
    if-ne v1, v2, :cond_0

    .line 44
    .line 45
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 46
    .line 47
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 48
    .line 49
    if-ne v1, v2, :cond_0

    .line 50
    .line 51
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 52
    .line 53
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 54
    .line 55
    if-ne v1, v2, :cond_0

    .line 56
    .line 57
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 58
    .line 59
    iget-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 60
    .line 61
    if-ne v1, v2, :cond_0

    .line 62
    .line 63
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 64
    .line 65
    iget-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 66
    .line 67
    if-eq v1, v2, :cond_0

    .line 68
    .line 69
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->V:Z

    .line 70
    .line 71
    iget-boolean v1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->V:Z

    .line 72
    .line 73
    if-eq v0, v1, :cond_0

    .line 74
    .line 75
    new-instance v0, Landroid/os/Bundle;

    .line 76
    .line 77
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v1, "enable_video_stabilization"

    .line 81
    .line 82
    iget-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 83
    .line 84
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 85
    .line 86
    .line 87
    const-string v1, "enable_ai_night_video"

    .line 88
    .line 89
    iget-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->V:Z

    .line 90
    .line 91
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 95
    .line 96
    invoke-virtual {v1, v0}, Lcom/ss/android/ttvecamera/c;->k0(Landroid/os/Bundle;)V

    .line 97
    .line 98
    .line 99
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 100
    .line 101
    const/4 p0, 0x1

    .line 102
    return p0

    .line 103
    :cond_0
    const/4 p0, 0x0

    .line 104
    return p0
.end method

.method private open(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 9
    .param p1    # Lcom/ss/android/ttvecamera/d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "Open camera failed, ret = "

    .line 2
    .line 3
    const-string v2, "No need open camera again, state = "

    .line 4
    .line 5
    invoke-direct/range {p0 .. p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    const/16 v0, -0x6c

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraPendingClose:Z

    .line 15
    .line 16
    const/16 v4, -0x69

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    const-string v0, "TECameraServer"

    .line 21
    .line 22
    const-string v1, "pending close"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return v4

    .line 28
    :cond_1
    iget-boolean v3, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->h0:Z

    .line 29
    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOnBackGround:Z

    .line 33
    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    const-string v0, "TECameraServer"

    .line 37
    .line 38
    const-string v1, "in background"

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return v4

    .line 44
    :cond_2
    iget-object v7, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 45
    .line 46
    if-nez v7, :cond_3

    .line 47
    .line 48
    const-string v0, "TECameraServer"

    .line 49
    .line 50
    const-string v1, "open, mHandler is null!"

    .line 51
    .line 52
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/16 v0, -0x70

    .line 56
    .line 57
    return v0

    .line 58
    :cond_3
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraPendingClose:Z

    .line 59
    .line 60
    if-eqz v3, :cond_4

    .line 61
    .line 62
    const-string v0, "TECameraServer"

    .line 63
    .line 64
    const-string v1, "had called disConnect(), abandon open camera!"

    .line 65
    .line 66
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const/16 v0, -0x71

    .line 70
    .line 71
    return v0

    .line 72
    :cond_4
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerDestroyed:Z

    .line 73
    .line 74
    const/4 v8, 0x0

    .line 75
    if-nez v3, :cond_5

    .line 76
    .line 77
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v7}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    if-eq v3, v4, :cond_5

    .line 86
    .line 87
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 88
    .line 89
    .line 90
    move-result-wide v2

    .line 91
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$v;

    .line 92
    .line 93
    move-object v1, p0

    .line 94
    move-object v4, p1

    .line 95
    move-object v5, p2

    .line 96
    move-object v6, p3

    .line 97
    invoke-direct/range {v0 .. v6}, Lcom/ss/android/ttvecamera/TECameraServer$v;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;JLcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v7, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 101
    .line 102
    .line 103
    goto/16 :goto_3

    .line 104
    .line 105
    :cond_5
    const-string v3, "TECameraServer-open"

    .line 106
    .line 107
    invoke-static {v3}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 111
    .line 112
    const-string v3, "TECameraServer"

    .line 113
    .line 114
    new-instance v4, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v7, "is force close camera="

    .line 117
    .line 118
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v7, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 122
    .line 123
    iget-boolean v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->R:Z

    .line 124
    .line 125
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v7, ", Camera2Detect="

    .line 129
    .line 130
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget-object v7, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 134
    .line 135
    iget-boolean v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->s0:Z

    .line 136
    .line 137
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-static {v3, v4}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    new-instance v3, Lcom/ss/android/ttvecamera/TECameraServer$g0;

    .line 148
    .line 149
    invoke-direct {v3, p0}, Lcom/ss/android/ttvecamera/TECameraServer$g0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 150
    .line 151
    .line 152
    iput-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCheckCloseTask:Ljava/lang/Runnable;

    .line 153
    .line 154
    const/4 v3, 0x0

    .line 155
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentZoom:F

    .line 156
    .line 157
    iget v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 158
    .line 159
    if-gez v3, :cond_6

    .line 160
    .line 161
    iget v3, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 162
    .line 163
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 164
    .line 165
    :cond_6
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 166
    .line 167
    monitor-enter v3

    .line 168
    :try_start_0
    iget v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 169
    .line 170
    const/4 v5, 0x1

    .line 171
    if-eqz v4, :cond_8

    .line 172
    .line 173
    const-string v0, "TECameraServer"

    .line 174
    .line 175
    new-instance v4, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 181
    .line 182
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-static {v0, v2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 193
    .line 194
    if-eq v0, v5, :cond_7

    .line 195
    .line 196
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 197
    .line 198
    const-string v1, "Camera features is ready"

    .line 199
    .line 200
    invoke-interface {v0, v5, v8, v1}, Lcom/ss/android/ttvecamera/d$b;->onInfo(IILjava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto :goto_0

    .line 204
    :catchall_0
    move-exception v0

    .line 205
    goto/16 :goto_4

    .line 206
    .line 207
    :cond_7
    :goto_0
    invoke-static {}, Ll/dsh0;->b()V

    .line 208
    .line 209
    .line 210
    monitor-exit v3

    .line 211
    return v8

    .line 212
    :cond_8
    invoke-virtual {p0, v5}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 213
    .line 214
    .line 215
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 216
    .line 217
    if-nez v2, :cond_b

    .line 218
    .line 219
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->createCameraInstance()Lcom/ss/android/ttvecamera/c;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    iput-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 224
    .line 225
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 226
    .line 227
    if-nez v2, :cond_a

    .line 228
    .line 229
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 230
    .line 231
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 232
    .line 233
    const/16 v2, 0xb

    .line 234
    .line 235
    if-ne v0, v2, :cond_9

    .line 236
    .line 237
    invoke-virtual {p0, v8}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 241
    .line 242
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 243
    .line 244
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 245
    .line 246
    const/16 v2, -0x1ac

    .line 247
    .line 248
    const/4 v4, 0x0

    .line 249
    invoke-interface {v0, v1, v2, v4, v4}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    goto :goto_1

    .line 253
    :cond_9
    invoke-virtual {p0, v8}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 254
    .line 255
    .line 256
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 257
    .line 258
    const-string v1, "open : mCameraInstance is null."

    .line 259
    .line 260
    const/16 v2, -0x64

    .line 261
    .line 262
    invoke-interface {v0, v2, v1}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :goto_1
    const/4 v0, -0x1

    .line 266
    monitor-exit v3

    .line 267
    return v0

    .line 268
    :cond_a
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 269
    .line 270
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->satZoomCallback:Lcom/ss/android/ttvecamera/c$f;

    .line 271
    .line 272
    invoke-virtual {v2, v4}, Lcom/ss/android/ttvecamera/c;->q0(Lcom/ss/android/ttvecamera/c$f;)V

    .line 273
    .line 274
    .line 275
    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 276
    .line 277
    .line 278
    move-result-wide v4

    .line 279
    iput-wide v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mBeginTime:J

    .line 280
    .line 281
    iget-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mEnableVBoost:Z

    .line 282
    .line 283
    if-eqz v2, :cond_c

    .line 284
    .line 285
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 286
    .line 287
    new-instance v4, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;

    .line 288
    .line 289
    sget-object v5, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;->BOOST_CPU:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 290
    .line 291
    iget v7, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mVBoostTimeoutMS:I

    .line 292
    .line 293
    invoke-direct {v4, v5, v7}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;-><init>(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;I)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v2, v4}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->c(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;)V

    .line 297
    .line 298
    .line 299
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 300
    .line 301
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 302
    .line 303
    invoke-virtual {v2, v4, p3}, Lcom/ss/android/ttvecamera/c;->W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 308
    .line 309
    new-instance v4, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;

    .line 310
    .line 311
    sget-object v5, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;->RESTORE_CPU:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 312
    .line 313
    invoke-direct {v4, v5}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;-><init>(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v1, v4}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->c(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;)V

    .line 317
    .line 318
    .line 319
    goto :goto_2

    .line 320
    :cond_c
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 321
    .line 322
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 323
    .line 324
    invoke-virtual {v2, v1, p3}, Lcom/ss/android/ttvecamera/c;->W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 325
    .line 326
    .line 327
    move-result v2

    .line 328
    :goto_2
    if-eqz v2, :cond_d

    .line 329
    .line 330
    const-string v1, "TECameraServer"

    .line 331
    .line 332
    new-instance v4, Ljava/lang/StringBuilder;

    .line 333
    .line 334
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    :cond_d
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 348
    invoke-static {}, Ll/dsh0;->b()V

    .line 349
    .line 350
    .line 351
    :goto_3
    return v8

    .line 352
    :goto_4
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 353
    throw v0
.end method

.method private realCloseCamera(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 7

    .line 1
    const-string v0, "system call close() cost: "

    .line 2
    .line 3
    const-string v1, "realCloseCamera, no need to close camera, state: "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    const-string p1, "TECameraServer"

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    const/4 v1, 0x4

    .line 35
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 47
    .line 48
    invoke-virtual {v1, p1}, Lcom/ss/android/ttvecamera/c;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v5

    .line 55
    sub-long/2addr v5, v3

    .line 56
    const-string p1, "TECameraServer"

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    const/4 p1, 0x0

    .line 74
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 75
    .line 76
    .line 77
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 78
    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->i()V

    .line 84
    .line 85
    .line 86
    const/4 p1, 0x0

    .line 87
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 88
    .line 89
    :cond_2
    monitor-exit v2

    .line 90
    return-void

    .line 91
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    throw p0
.end method

.method private setAsyncCloseCheckMsg()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mMainHandler:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCheckCloseTask:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mMainHandler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCheckCloseTask:Ljava/lang/Runnable;

    .line 11
    .line 12
    const-wide/16 v1, 0x7d0

    .line 13
    .line 14
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private shouldReOpenCamera(Lcom/ss/android/ttvecamera/TECameraSettings;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 6
    .line 7
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 8
    .line 9
    if-ne v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 12
    .line 13
    iget v2, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 14
    .line 15
    iget-object v3, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 16
    .line 17
    iget v4, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 18
    .line 19
    if-ne v2, v4, :cond_0

    .line 20
    .line 21
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 22
    .line 23
    iget v2, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 24
    .line 25
    if-ne v1, v2, :cond_0

    .line 26
    .line 27
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 28
    .line 29
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 30
    .line 31
    if-ne v1, v2, :cond_0

    .line 32
    .line 33
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->N:I

    .line 34
    .line 35
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->N:I

    .line 36
    .line 37
    if-ne v1, v2, :cond_0

    .line 38
    .line 39
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 40
    .line 41
    iget-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 42
    .line 43
    if-ne v1, v2, :cond_0

    .line 44
    .line 45
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 46
    .line 47
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 48
    .line 49
    if-ne v1, v2, :cond_0

    .line 50
    .line 51
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 52
    .line 53
    iget v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 54
    .line 55
    if-ne v1, v2, :cond_0

    .line 56
    .line 57
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 58
    .line 59
    iget-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 60
    .line 61
    if-ne v1, v2, :cond_0

    .line 62
    .line 63
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 64
    .line 65
    iget v1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 66
    .line 67
    if-ne v0, v1, :cond_0

    .line 68
    .line 69
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->isARConfigNotEqual(Lcom/ss/android/ttvecamera/TECameraSettings;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    :cond_0
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_1
    const/4 p0, 0x0

    .line 78
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/android/ttvecamera/TECameraServer;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/android/ttvecamera/TECameraServer;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/android/ttvecamera/TECameraServer;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraServer;->$VALUES:[Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/android/ttvecamera/TECameraServer;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/android/ttvecamera/TECameraServer;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abortSession(Lcom/ss/android/ttvecamera/d;)I
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    const-string p0, "TECameraServer"

    .line 15
    .line 16
    const-string p1, "abortSession, mHandler is null!"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/16 p0, -0x70

    .line 22
    .line 23
    return p0

    .line 24
    :cond_1
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$z0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer$z0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public addCameraAlgorithm(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECameraServer"

    .line 6
    .line 7
    const-string p1, "addCameraAlgorithm failed mCameraInstance is null!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/c;->b(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public addCameraProvider(Lcom/ss/android/ttvecamera/d;Ll/jrh0$a;)I
    .locals 4

    .line 1
    const-string v0, "addCameraProvider, mProviderSettings = "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/16 p0, -0x6c

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerDestroyed:Z

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    invoke-virtual {v3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-eq v1, v3, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 30
    .line 31
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$w0;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$w0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Ll/jrh0$a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    const-string p1, "TECameraServer"

    .line 41
    .line 42
    const-string v1, "addCameraProvider"

    .line 43
    .line 44
    invoke-static {p1, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 48
    .line 49
    monitor-enter p1

    .line 50
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 51
    .line 52
    if-nez v1, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 55
    .line 56
    const-string p2, "Invalidate Camera Instance!!"

    .line 57
    .line 58
    const/16 v0, -0x64

    .line 59
    .line 60
    invoke-interface {p0, v0, p2}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    monitor-exit p1

    .line 64
    return v0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_3

    .line 67
    :cond_2
    const-string v1, "TECameraServer"

    .line 68
    .line 69
    new-instance v3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderSettings:Ll/jrh0$a;

    .line 75
    .line 76
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v0, ", providerSettings = "

    .line 80
    .line 81
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderSettings:Ll/jrh0$a;

    .line 95
    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderSettings:Ll/jrh0$a;

    .line 107
    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    invoke-virtual {v0, p2}, Ll/jrh0$a;->b(Ll/jrh0$a;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_3

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraProviderChanged:Z

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderManager:Ll/jrh0;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 123
    .line 124
    invoke-virtual {v0, p2, v1}, Ll/jrh0;->a(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 125
    .line 126
    .line 127
    const/4 v0, 0x1

    .line 128
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraProviderChanged:Z

    .line 129
    .line 130
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderSettings:Ll/jrh0$a;

    .line 131
    .line 132
    if-nez v0, :cond_5

    .line 133
    .line 134
    new-instance v0, Ll/jrh0$a;

    .line 135
    .line 136
    invoke-direct {v0, p2}, Ll/jrh0$a;-><init>(Ll/jrh0$a;)V

    .line 137
    .line 138
    .line 139
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderSettings:Ll/jrh0$a;

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_5
    invoke-virtual {v0, p2}, Ll/jrh0$a;->a(Ll/jrh0$a;)V

    .line 143
    .line 144
    .line 145
    :goto_1
    monitor-exit p1

    .line 146
    :goto_2
    return v2

    .line 147
    :goto_3
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    throw p0
.end method

.method public appLifeCycleChanged(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mOnBackGround:Z

    .line 2
    .line 3
    return-void
.end method

.method public cancelFocus(Lcom/ss/android/ttvecamera/d;)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$i;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer$i;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v0, "cancelFocus..."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->c()V

    .line 46
    .line 47
    .line 48
    monitor-exit p1

    .line 49
    :goto_0
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0
.end method

.method public captureBurst(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$c;Ll/hj3;)I
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$e;

    .line 13
    .line 14
    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$e;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/TECameraSettings$c;Ll/hj3;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public changeCaptureFormat()V
    .locals 0

    return-void
.end method

.method public changeRecorderState(Lcom/ss/android/ttvecamera/d;ILcom/ss/android/ttvecamera/c$c;)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandlerDestroyed:Z

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 27
    .line 28
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$t0;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$t0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;ILcom/ss/android/ttvecamera/c$c;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 38
    .line 39
    monitor-enter p1

    .line 40
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 45
    .line 46
    const-string p2, "Invalidate Camera Instance!!"

    .line 47
    .line 48
    const/16 p3, -0x64

    .line 49
    .line 50
    invoke-interface {p0, p3, p2}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    monitor-exit p1

    .line 54
    return p3

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 58
    .line 59
    invoke-virtual {p0, p2, p3}, Lcom/ss/android/ttvecamera/c;->e(ILcom/ss/android/ttvecamera/c$c;)V

    .line 60
    .line 61
    .line 62
    monitor-exit p1

    .line 63
    :goto_0
    const/4 p0, 0x0

    .line 64
    return p0

    .line 65
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    throw p0
.end method

.method public connect(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/d$b;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/ss/android/ttvecamera/d$d;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 3
    .param p1    # Lcom/ss/android/ttvecamera/d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/ttvecamera/d$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/ss/android/ttvecamera/TECameraSettings;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p4, "TECameraServer"

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "connect with client: "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p4, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p4, 0x0

    .line 21
    if-eqz p1, :cond_6

    .line 22
    .line 23
    if-eqz p2, :cond_5

    .line 24
    .line 25
    if-eqz p3, :cond_4

    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mMainHandler:Landroid/os/Handler;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCheckCloseTask:Ljava/lang/Runnable;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mLock:Ljava/lang/Object;

    .line 35
    .line 36
    monitor-enter v0

    .line 37
    :try_start_0
    invoke-direct {p0, p3}, Lcom/ss/android/ttvecamera/TECameraServer;->shouldReOpenCamera(Lcom/ss/android/ttvecamera/TECameraSettings;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 42
    .line 43
    if-ne p1, v2, :cond_0

    .line 44
    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const-string p0, "TECameraServer"

    .line 48
    .line 49
    const-string p1, "No need reconnect."

    .line 50
    .line 51
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    monitor-exit v0

    .line 55
    return p4

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsInitialized:Z

    .line 59
    .line 60
    if-nez v2, :cond_1

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-direct {p0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->init(Z)V

    .line 64
    .line 65
    .line 66
    move v1, p4

    .line 67
    :cond_1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 68
    .line 69
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 70
    .line 71
    iget-boolean p2, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->S:Z

    .line 72
    .line 73
    iput-boolean p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mEnableVBoost:Z

    .line 74
    .line 75
    const/4 v2, -0x1

    .line 76
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 77
    .line 78
    if-eqz p2, :cond_2

    .line 79
    .line 80
    iget p2, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->T:I

    .line 81
    .line 82
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mVBoostTimeoutMS:I

    .line 83
    .line 84
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 85
    .line 86
    new-instance v2, Ll/esh0;

    .line 87
    .line 88
    invoke-direct {v2}, Ll/esh0;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2, v2}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->b(Ll/q6m;)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mSystemResManager:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;

    .line 95
    .line 96
    iget-object v2, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 97
    .line 98
    invoke-virtual {p2, v2}, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->a(Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->increaseClientCount()I

    .line 103
    .line 104
    .line 105
    if-eqz v1, :cond_3

    .line 106
    .line 107
    const-string p2, "TECameraServer"

    .line 108
    .line 109
    const-string v0, "reopen camera."

    .line 110
    .line 111
    invoke-static {p2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {p0, p5}, Lcom/ss/android/ttvecamera/TECameraServer;->close(Lcom/bytedance/bpea/basics/Cert;)I

    .line 115
    .line 116
    .line 117
    :cond_3
    iput-boolean p4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraPendingClose:Z

    .line 118
    .line 119
    iput-object p5, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedOpenPrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 120
    .line 121
    invoke-direct {p0, p1, p3, p5}, Lcom/ss/android/ttvecamera/TECameraServer;->open(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    return p0

    .line 126
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    throw p0

    .line 128
    :cond_4
    const-string p0, "mParams must not be null"

    .line 129
    .line 130
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return p4

    .line 134
    :cond_5
    const-string p0, "observer must not be null"

    .line 135
    .line 136
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return p4

    .line 140
    :cond_6
    const-string p0, "client must not be null"

    .line 141
    .line 142
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return p4
.end method

.method public couldForwardState(I)Z
    .locals 4

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 2
    .line 3
    const-string v1, "TECameraServer"

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const-string v0, "No need this"

    .line 8
    .line 9
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    if-eqz p1, :cond_4

    .line 14
    .line 15
    if-eq p1, v0, :cond_3

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eq p1, v2, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    if-eq p1, v2, :cond_1

    .line 23
    .line 24
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v0, "Invalidate camera state = "

    .line 27
    .line 28
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return v3

    .line 42
    :cond_1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 43
    .line 44
    if-ne p0, v0, :cond_2

    .line 45
    .line 46
    return v0

    .line 47
    :cond_2
    return v3

    .line 48
    :cond_3
    iget p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v2, "No need open camera again, state = "

    .line 55
    .line 56
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    return v0
.end method

.method public disConnect(Lcom/ss/android/ttvecamera/d;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 1

    const/4 v0, 0x1

    .line 71
    invoke-virtual {p0, p1, v0, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->disConnect(Lcom/ss/android/ttvecamera/d;ZLcom/bytedance/bpea/basics/Cert;)I

    move-result p0

    return p0
.end method

.method public disConnect(Lcom/ss/android/ttvecamera/d;ZLcom/bytedance/bpea/basics/Cert;)I
    .locals 3

    .line 1
    const-string v0, "TECameraServer"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "disConnect with client: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraSwitchState:Z

    .line 22
    .line 23
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mLock:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter v1

    .line 26
    :try_start_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 27
    .line 28
    if-ne v2, p1, :cond_2

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClient:Lcom/ss/android/ttvecamera/d;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 36
    .line 37
    invoke-virtual {v2, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    iput-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->cachedClosePrivacyCert:Lcom/bytedance/bpea/basics/Cert;

    .line 42
    .line 43
    invoke-direct {p0, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer;->close(ZLcom/bytedance/bpea/basics/Cert;)I

    .line 44
    .line 45
    .line 46
    if-eqz p2, :cond_0

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->decreaseClientCount()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->destroy()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->setAsyncCloseCheckMsg()V

    .line 60
    .line 61
    .line 62
    :cond_1
    return v0

    .line 63
    :catchall_0
    move-exception p0

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const/16 p0, -0x64

    .line 66
    .line 67
    :try_start_1
    monitor-exit v1

    .line 68
    return p0

    .line 69
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    throw p0
.end method

.method public downExposureCompensation(Lcom/ss/android/ttvecamera/d;)V
    .locals 3

    .line 1
    const-string v0, "Can not set ec on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eq v1, v2, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$y;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer$y;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v1, "downExposureCompensation..."

    .line 36
    .line 37
    invoke-static {p1, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    if-eq v1, v2, :cond_2

    .line 47
    .line 48
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 49
    .line 50
    const/4 v2, 0x2

    .line 51
    if-eq v1, v2, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 54
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 61
    .line 62
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/16 v0, -0x69

    .line 70
    .line 71
    invoke-interface {v1, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    monitor-exit p1

    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->s()Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 87
    .line 88
    const-string v0, "downExposureCompensation get ec info failed"

    .line 89
    .line 90
    const/16 v1, -0x70

    .line 91
    .line 92
    invoke-interface {p0, v1, v0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    monitor-exit p1

    .line 96
    return-void

    .line 97
    :cond_3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 98
    .line 99
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 100
    .line 101
    add-int/lit8 v0, v0, -0x1

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/c;->j0(I)Z

    .line 104
    .line 105
    .line 106
    monitor-exit p1

    .line 107
    return-void

    .line 108
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    throw p0
.end method

.method public enableCaf(Lcom/ss/android/ttvecamera/d;)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$j;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer$j;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v0, "enableCaf..."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->j()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_0
    monitor-exit p1

    .line 56
    :goto_1
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public enableMulticamZoom(Lcom/ss/android/ttvecamera/d;Z)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$u0;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$u0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v1, "enableMulticamZoom: "

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter p1

    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 60
    .line 61
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->k(Z)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_2

    .line 67
    :cond_2
    :goto_0
    monitor-exit p1

    .line 68
    :goto_1
    const/4 p0, 0x0

    .line 69
    return p0

    .line 70
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    throw p0
.end method

.method public focusAtPoint(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TEFocusSettings;)I
    .locals 3

    .line 1
    const-string v0, "Can not set focus on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/16 p0, -0x6c

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eq v1, v2, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 25
    .line 26
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$h;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$h;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TEFocusSettings;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p1, "TECameraServer"

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "focusAtPoint at: "

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {p1, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 55
    .line 56
    monitor-enter p1

    .line 57
    :try_start_0
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 58
    .line 59
    const/4 v2, 0x3

    .line 60
    if-eq v1, v2, :cond_2

    .line 61
    .line 62
    new-instance p2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 68
    .line 69
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const-string v0, "TECameraServer"

    .line 77
    .line 78
    invoke-static {v0, p2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 82
    .line 83
    const/16 v0, -0x69

    .line 84
    .line 85
    invoke-interface {p0, v0, p2}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    monitor-exit p1

    .line 89
    return v0

    .line 90
    :catchall_0
    move-exception p0

    .line 91
    goto :goto_1

    .line 92
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 93
    .line 94
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->m(Lcom/ss/android/ttvecamera/TEFocusSettings;)V

    .line 95
    .line 96
    .line 97
    monitor-exit p1

    .line 98
    :goto_0
    const/4 p0, 0x0

    .line 99
    return p0

    .line 100
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    throw p0
.end method

.method public getApertureRange(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$a;)[F
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    aput v2, v0, v1

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    new-array p0, p0, [F

    .line 16
    .line 17
    fill-array-data p0, :array_0

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eq v1, v2, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 34
    .line 35
    new-instance v2, Lcom/ss/android/ttvecamera/TECameraServer$i0;

    .line 36
    .line 37
    invoke-direct {v2, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$i0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 45
    .line 46
    monitor-enter p1

    .line 47
    :try_start_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->o()[F

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    :goto_0
    monitor-exit p1

    .line 61
    return-object v0

    .line 62
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    throw p0

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method public getBestPreviewSize(Lcom/ss/android/ttvecamera/d;FLcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne p1, v1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 20
    .line 21
    invoke-virtual {p0, p2, p3}, Lcom/ss/android/ttvecamera/c;->p(FLcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_2
    :goto_0
    return-object v0
.end method

.method public getCameraCapbilitiesForBytebench(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$b;)Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    if-eq v1, v2, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 27
    .line 28
    new-instance v2, Lcom/ss/android/ttvecamera/TECameraServer$v0;

    .line 29
    .line 30
    invoke-direct {v2, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$v0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$b;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_1
    const-string p1, "TECameraServer"

    .line 38
    .line 39
    const-string p2, "getCameraCapbilitiesForBytebench"

    .line 40
    .line 41
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 45
    .line 46
    monitor-enter p1

    .line 47
    :try_start_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->q()Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    :goto_0
    monitor-exit p1

    .line 61
    return-object v0

    .line 62
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    throw p0
.end method

.method public getCameraCaptureSize()[I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->r()[I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getCameraECInfo(Lcom/ss/android/ttvecamera/d;)Lcom/ss/android/ttvecamera/TECameraSettings$d;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->s()Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    return-object v0
.end method

.method public getCameraState()I
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/TECameraServer;->getCameraState(Z)I

    move-result p0

    return p0
.end method

.method public getCameraState(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter p1

    .line 6
    :try_start_0
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 7
    .line 8
    monitor-exit p1

    .line 9
    return p0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0

    .line 13
    :cond_0
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 14
    .line 15
    return p0
.end method

.method public getExposureCompensation(Lcom/ss/android/ttvecamera/d;)I
    .locals 3

    .line 1
    const-string v0, "Can not get ec on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter p1

    .line 12
    :try_start_0
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    if-eq v1, v2, :cond_0

    .line 16
    .line 17
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    if-eq v1, v2, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 30
    .line 31
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/16 v0, -0x69

    .line 39
    .line 40
    invoke-interface {v1, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    monitor-exit p1

    .line 44
    return v0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->w()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    monitor-exit p1

    .line 54
    return p0

    .line 55
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0

    .line 57
    :cond_1
    const-string p0, "Client is not connected!!!"

    .line 58
    .line 59
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    return p0
.end method

.method public getFOV(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$e;)[F
    .locals 5

    .line 1
    const-string v0, "Can not getFOV on state : "

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v2, v1, [F

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    new-array p0, v1, [F

    .line 13
    .line 14
    fill-array-data p0, :array_0

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    invoke-virtual {v4}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    if-eq v3, v4, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 31
    .line 32
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$d;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$d;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$e;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 38
    .line 39
    .line 40
    return-object v2

    .line 41
    :cond_1
    const-string p1, "TECameraServer"

    .line 42
    .line 43
    const-string p2, "getFOV"

    .line 44
    .line 45
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 49
    .line 50
    monitor-enter p1

    .line 51
    :try_start_0
    iget p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 52
    .line 53
    const/4 v2, 0x3

    .line 54
    if-eq p2, v2, :cond_2

    .line 55
    .line 56
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 57
    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 64
    .line 65
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const/16 v0, -0x69

    .line 73
    .line 74
    invoke-interface {p2, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    new-array p0, v1, [F

    .line 78
    .line 79
    fill-array-data p0, :array_1

    .line 80
    .line 81
    .line 82
    monitor-exit p1

    .line 83
    return-object p0

    .line 84
    :catchall_0
    move-exception p0

    .line 85
    goto :goto_0

    .line 86
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->x()[F

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    monitor-exit p1

    .line 93
    return-object p0

    .line 94
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    throw p0

    .line 96
    nop

    .line 97
    :array_0
    .array-data 4
        -0x40000000    # -2.0f
        -0x40000000    # -2.0f
    .end array-data

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    :array_1
    .array-data 4
        -0x40000000    # -2.0f
        -0x40000000    # -2.0f
    .end array-data
.end method

.method public getFlashMode(Lcom/ss/android/ttvecamera/d;)I
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->B()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getISO(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$g;)I
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eq v0, v2, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v2, Lcom/ss/android/ttvecamera/TECameraServer$e0;

    .line 24
    .line 25
    invoke-direct {v2, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$e0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$g;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 33
    .line 34
    monitor-enter p1

    .line 35
    :try_start_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 36
    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->F()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    :goto_0
    monitor-exit p1

    .line 49
    return v1

    .line 50
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0
.end method

.method public getISORange(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$h;)[I
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    filled-new-array {p0, p0}, [I

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-eq v1, v2, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 29
    .line 30
    new-instance v2, Lcom/ss/android/ttvecamera/TECameraServer$c0;

    .line 31
    .line 32
    invoke-direct {v2, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$c0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$h;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 40
    .line 41
    monitor-enter p1

    .line 42
    :try_start_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->G()[I

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    :goto_0
    monitor-exit p1

    .line 56
    return-object v0

    .line 57
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p0
.end method

.method public getManualFocusAbility(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$i;)F
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, -0x40800000    # -1.0f

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eq v0, v2, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v2, Lcom/ss/android/ttvecamera/TECameraServer$l;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$l;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$i;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 34
    .line 35
    monitor-enter p1

    .line 36
    :try_start_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 37
    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->H()F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    :goto_0
    monitor-exit p1

    .line 50
    return v1

    .line 51
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public getPictureSize(Lcom/ss/android/ttvecamera/d;)[I
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->I()[I

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getPreviewFps()[I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->J()[I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getShutterTimeRange(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$o;)[J
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [J

    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    new-array p0, v0, [J

    .line 11
    .line 12
    fill-array-data p0, :array_0

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-eq v0, v2, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 29
    .line 30
    new-instance v2, Lcom/ss/android/ttvecamera/TECameraServer$f0;

    .line 31
    .line 32
    invoke-direct {v2, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$f0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$o;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    return-object v1

    .line 39
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 40
    .line 41
    monitor-enter p1

    .line 42
    :try_start_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->M()[J

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    :goto_0
    monitor-exit p1

    .line 56
    return-object v1

    .line 57
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p0

    .line 59
    :array_0
    .array-data 8
        -0x1
        -0x1
    .end array-data
.end method

.method public getSupportedPictureSizes(Lcom/ss/android/ttvecamera/d;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ttvecamera/d;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->N()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    const-string p1, "TECameraServer"

    .line 23
    .line 24
    const-string v1, "getSupportedPictureSizes, exception occured."

    .line 25
    .line 26
    invoke-static {p1, v1, p0}, Lcom/ss/android/ttvecamera/g;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public getSupportedPreviewSizes(Lcom/ss/android/ttvecamera/d;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ttvecamera/d;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->O()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    const-string p1, "TECameraServer"

    .line 23
    .line 24
    const-string v1, "getSupportedPreviewSizes, exception occured."

    .line 25
    .line 26
    invoke-static {p1, v1, p0}, Lcom/ss/android/ttvecamera/g;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public isAutoExposureLockSupported(Lcom/ss/android/ttvecamera/d;)Z
    .locals 4

    .line 1
    const-string v0, "Can not get ae lock supported on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 15
    .line 16
    const/4 v3, 0x3

    .line 17
    if-eq v2, v3, :cond_1

    .line 18
    .line 19
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    if-eq v2, v3, :cond_1

    .line 23
    .line 24
    const-string v2, "TECameraServer"

    .line 25
    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 32
    .line 33
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    monitor-exit p1

    .line 44
    return v1

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->Q()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    monitor-exit p1

    .line 54
    return p0

    .line 55
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public isAutoFocusLockSupported(Lcom/ss/android/ttvecamera/d;)Z
    .locals 4

    .line 1
    const-string v0, "Can not get ae lock supported on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 15
    .line 16
    const/4 v3, 0x3

    .line 17
    if-eq v2, v3, :cond_1

    .line 18
    .line 19
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    if-eq v2, v3, :cond_1

    .line 23
    .line 24
    const-string v2, "TECameraServer"

    .line 25
    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 32
    .line 33
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    monitor-exit p1

    .line 44
    return v1

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->R()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    monitor-exit p1

    .line 54
    return p0

    .line 55
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public isCameraSwitchState()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraSwitchState:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSupportWhileBalance(Lcom/ss/android/ttvecamera/d;)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter p1

    .line 12
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->T()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    monitor-exit p1

    .line 29
    return v0

    .line 30
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public isSupportedExposureCompensation(Lcom/ss/android/ttvecamera/d;)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq p1, v1, :cond_1

    .line 13
    .line 14
    iget p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq p1, v1, :cond_1

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "Can not set ec on state : "

    .line 22
    .line 23
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "TECameraServer"

    .line 36
    .line 37
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->U()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method public isTorchSupported(Lcom/ss/android/ttvecamera/d;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->V()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    return v0
.end method

.method public notifyHostForegroundVisible(Lcom/ss/android/ttvecamera/d;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iput-boolean p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsForegroundVisible:Z

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p1, "is foreground visible: "

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "TECameraServer"

    .line 24
    .line 25
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public process(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$j;)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$u;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$u;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$j;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v0, "setFeatureParameters..."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->X(Lcom/ss/android/ttvecamera/TECameraSettings$j;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_0
    monitor-exit p1

    .line 56
    :goto_1
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public processAlgorithm(Lcom/ss/android/ttvecamera/TECameraFrame;)Lcom/ss/android/ttvecamera/TECameraFrame;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECameraServer"

    .line 6
    .line 7
    const-string p1, "processAlgorithm failed mCameraInstance is null!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/c;->Y(Lcom/ss/android/ttvecamera/TECameraFrame;)Lcom/ss/android/ttvecamera/TECameraFrame;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public queryFeatures(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    const-string v1, "TECameraServer"

    .line 4
    .line 5
    if-eqz v0, :cond_c

    .line 6
    .line 7
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/c;->z(Ljava/lang/String;)Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const-string p0, "queryFeatures: getFeatures is null"

    .line 16
    .line 17
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_b

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraSettings$f;->a(Ljava/lang/String;)Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const-class v3, Ljava/lang/Boolean;

    .line 52
    .line 53
    if-ne v2, v3, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {p2, v0, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const-class v3, Ljava/lang/Integer;

    .line 64
    .line 65
    if-ne v2, v3, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {p2, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    const-class v3, Ljava/lang/Long;

    .line 76
    .line 77
    if-ne v2, v3, :cond_4

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    invoke-virtual {p2, v0, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    const-class v3, Ljava/lang/Float;

    .line 88
    .line 89
    if-ne v2, v3, :cond_5

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_5
    const-class v3, Ljava/lang/Double;

    .line 100
    .line 101
    if-ne v2, v3, :cond_6

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getDouble(Ljava/lang/String;)D

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    invoke-virtual {p2, v0, v2, v3}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    const-class v3, Ljava/lang/String;

    .line 112
    .line 113
    if-ne v2, v3, :cond_7

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {p2, v0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_7
    const-class v3, Ljava/util/ArrayList;

    .line 124
    .line 125
    if-ne v2, v3, :cond_8

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_8
    const-class v3, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 136
    .line 137
    if-ne v2, v3, :cond_9

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_9
    const-class v3, Lcom/ss/android/ttvecamera/TEFocusParameters;

    .line 148
    .line 149
    if-ne v2, v3, :cond_a

    .line 150
    .line 151
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 156
    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_a
    new-instance v2, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    const-string v3, "Not supported key:"

    .line 163
    .line 164
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_b
    return-void

    .line 180
    :cond_c
    const-string p0, "queryFeatures: camera instance null"

    .line 181
    .line 182
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public queryShaderZoomStep(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$n;)F
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/high16 p0, -0x3d280000    # -108.0f

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$q;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$q;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$n;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v0, "queryShaderZoomStep..."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->Z(Lcom/ss/android/ttvecamera/TECameraSettings$n;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_0
    monitor-exit p1

    .line 56
    :goto_1
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public queryZoomAbility(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$p;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$p;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v0, "queryZoomAbility..."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0, p2, p3}, Lcom/ss/android/ttvecamera/c;->a0(Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_0
    monitor-exit p1

    .line 56
    :goto_1
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public registerFpsConfigListener(Lcom/ss/android/ttvecamera/d$a;)V
    .locals 0

    return-void
.end method

.method public registerPreviewSizeListener(Lcom/ss/android/ttvecamera/d$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mPreviewSizeCallback:Lcom/ss/android/ttvecamera/d$e;

    .line 2
    .line 3
    return-void
.end method

.method public removeCameraAlgorithm(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECameraServer"

    .line 6
    .line 7
    const-string p1, "removeCameraAlgorithm failed mCameraInstance is null!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/c;->d0(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public removeCameraProvider(Lcom/ss/android/ttvecamera/d;)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$x0;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer$x0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v0, "removeCameraProvider"

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderManager:Ll/jrh0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/jrh0;->k()V

    .line 46
    .line 47
    .line 48
    monitor-exit p1

    .line 49
    :goto_0
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0
.end method

.method public setAperture(Lcom/ss/android/ttvecamera/d;F)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$j0;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$j0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter p1

    .line 34
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->f0(F)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_0
    monitor-exit p1

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method public setAutoExposureLock(Lcom/ss/android/ttvecamera/d;Z)V
    .locals 3

    .line 1
    const-string v0, "Can not set auto exposure lock on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eq v1, v2, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$z;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$z;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v1, "setAutoExposureLock..."

    .line 36
    .line 37
    invoke-static {p1, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    if-eq v1, v2, :cond_2

    .line 47
    .line 48
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 49
    .line 50
    const/4 v2, 0x2

    .line 51
    if-eq v1, v2, :cond_2

    .line 52
    .line 53
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 54
    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 61
    .line 62
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/16 v0, -0x69

    .line 70
    .line 71
    invoke-interface {p2, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    monitor-exit p1

    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 79
    .line 80
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->g0(Z)V

    .line 81
    .line 82
    .line 83
    monitor-exit p1

    .line 84
    return-void

    .line 85
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    throw p0
.end method

.method public setAutoFocusLock(Lcom/ss/android/ttvecamera/d;Z)V
    .locals 3

    .line 1
    const-string v0, "Can not set auto exposure lock on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eq v1, v2, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$a0;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$a0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v1, "setAutoExposureLock..."

    .line 36
    .line 37
    invoke-static {p1, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    if-eq v1, v2, :cond_2

    .line 47
    .line 48
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 49
    .line 50
    const/4 v2, 0x2

    .line 51
    if-eq v1, v2, :cond_2

    .line 52
    .line 53
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 54
    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 61
    .line 62
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/16 v0, -0x69

    .line 70
    .line 71
    invoke-interface {p2, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    monitor-exit p1

    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 79
    .line 80
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->h0(Z)V

    .line 81
    .line 82
    .line 83
    monitor-exit p1

    .line 84
    return-void

    .line 85
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    throw p0
.end method

.method public setDeviceRotation(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/c;->i0(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setExposureCompensation(Lcom/ss/android/ttvecamera/d;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$w;

    .line 13
    .line 14
    invoke-direct {v0, p0, p2}, Lcom/ss/android/ttvecamera/TECameraServer$w;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    :goto_0
    const-string p0, "TECameraServer"

    .line 22
    .line 23
    const-string p1, "setExposureCompensation failed"

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setFeatureParameters(Lcom/ss/android/ttvecamera/d;Landroid/os/Bundle;)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$t;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$t;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Landroid/os/Bundle;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v0, "setFeatureParameters..."

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->k0(Landroid/os/Bundle;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_0
    monitor-exit p1

    .line 56
    :goto_1
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public setISO(Lcom/ss/android/ttvecamera/d;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$d0;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$d0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter p1

    .line 34
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->l0(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_0
    monitor-exit p1

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method public setManualFocusDistance(Lcom/ss/android/ttvecamera/d;F)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$m;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$m;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter p1

    .line 34
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->m0(F)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_0
    monitor-exit p1

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method public setPictureSize(Lcom/ss/android/ttvecamera/d;II)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$n;

    .line 12
    .line 13
    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$n;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p1, "set picture size failed, w: "

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, ", h: "

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "TECameraServer"

    .line 43
    .line 44
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public setPreviewFpsRange(Lcom/ss/android/ttvecamera/TEFrameRateRange;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput p1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 16
    .line 17
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 18
    .line 19
    if-ne v1, p1, :cond_1

    .line 20
    .line 21
    const/4 p1, 0x4

    .line 22
    iput p1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 26
    .line 27
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->o0()V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void
.end method

.method public setSATZoomCallback(Lcom/ss/android/ttvecamera/TECameraSettings$m;)V
    .locals 0

    return-void
.end method

.method public setSceneMode(Lcom/ss/android/ttvecamera/d;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$o;

    .line 12
    .line 13
    invoke-direct {v0, p0, p2}, Lcom/ss/android/ttvecamera/TECameraServer$o;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p1, "set scnen failed: "

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "TECameraServer"

    .line 35
    .line 36
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public setShutterTime(Lcom/ss/android/ttvecamera/d;J)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$h0;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$h0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;J)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter p1

    .line 34
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 39
    .line 40
    invoke-virtual {p0, p2, p3}, Lcom/ss/android/ttvecamera/c;->s0(J)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_0
    monitor-exit p1

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method public setWhileBalance(Lcom/ss/android/ttvecamera/d;ZLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$b0;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$b0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter p1

    .line 34
    :try_start_0
    const-string v0, "TECameraServer"

    .line 35
    .line 36
    const-string v1, "setWhileBalance..."

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 46
    .line 47
    invoke-virtual {p0, p2, p3}, Lcom/ss/android/ttvecamera/c;->t0(ZLjava/lang/String;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    :goto_0
    monitor-exit p1

    .line 54
    return-void

    .line 55
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public start(Lcom/ss/android/ttvecamera/d;)I
    .locals 8

    .line 1
    const-string v0, " ==> 3"

    .line 2
    .line 3
    const-string v1, "Invalidate state: "

    .line 4
    .line 5
    const-string v2, "start, no need to start capture, state: "

    .line 6
    .line 7
    const-string v3, "TECameraServer"

    .line 8
    .line 9
    new-instance v4, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v5, "start: client "

    .line 12
    .line 13
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {v3, v4}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_0

    .line 31
    .line 32
    const/16 p0, -0x6c

    .line 33
    .line 34
    return p0

    .line 35
    :cond_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 36
    .line 37
    if-eqz v3, :cond_8

    .line 38
    .line 39
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 40
    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    goto/16 :goto_2

    .line 44
    .line 45
    :cond_1
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 46
    .line 47
    if-nez v3, :cond_2

    .line 48
    .line 49
    const-string p0, "TECameraServer"

    .line 50
    .line 51
    const-string p1, "start, mHandler is null!"

    .line 52
    .line 53
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/16 p0, -0x70

    .line 57
    .line 58
    return p0

    .line 59
    :cond_2
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    const/4 v6, 0x0

    .line 68
    if-eq v4, v5, :cond_3

    .line 69
    .line 70
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$y0;

    .line 71
    .line 72
    invoke-direct {v0, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer$y0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 79
    .line 80
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 81
    .line 82
    if-eqz p1, :cond_7

    .line 83
    .line 84
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/os/ConditionVariable;->close()V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 94
    .line 95
    const-wide/16 v2, 0x7d0

    .line 96
    .line 97
    invoke-virtual {p0, v2, v3}, Landroid/os/ConditionVariable;->block(J)Z

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 101
    .line 102
    .line 103
    move-result-wide p0

    .line 104
    sub-long/2addr p0, v0

    .line 105
    const-string v0, "TECameraServer"

    .line 106
    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v2, "Camera start cost: "

    .line 110
    .line 111
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string p0, "ms"

    .line 118
    .line 119
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_0

    .line 130
    .line 131
    :cond_3
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 132
    .line 133
    monitor-enter p1

    .line 134
    :try_start_0
    iget v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 135
    .line 136
    const/4 v4, 0x2

    .line 137
    const/4 v5, 0x3

    .line 138
    if-ne v3, v5, :cond_5

    .line 139
    .line 140
    const-string v3, "TECameraServer"

    .line 141
    .line 142
    new-instance v7, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 148
    .line 149
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iget-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraProviderChanged:Z

    .line 160
    .line 161
    if-nez v2, :cond_4

    .line 162
    .line 163
    iget-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStartPreviewError:Z

    .line 164
    .line 165
    if-nez v2, :cond_4

    .line 166
    .line 167
    monitor-exit p1

    .line 168
    return v6

    .line 169
    :catchall_0
    move-exception p0

    .line 170
    goto/16 :goto_1

    .line 171
    .line 172
    :cond_4
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 173
    .line 174
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/c;->x0()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0, v4}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 178
    .line 179
    .line 180
    iput-boolean v6, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraProviderChanged:Z

    .line 181
    .line 182
    :cond_5
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    .line 184
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 185
    .line 186
    if-eq v2, v4, :cond_6

    .line 187
    .line 188
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 194
    .line 195
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    const/16 v0, -0x69

    .line 206
    .line 207
    invoke-interface {v3, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 208
    .line 209
    .line 210
    monitor-exit p1

    .line 211
    return v0

    .line 212
    :cond_6
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 213
    .line 214
    const-string v1, "Camera state: opened"

    .line 215
    .line 216
    invoke-interface {v3, v5, v0, v1}, Lcom/ss/android/ttvecamera/d$b;->onInfo(IILjava/lang/String;)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->u0()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, v5}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 225
    .line 226
    .line 227
    const-string v0, "te_record_camera_type"

    .line 228
    .line 229
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 230
    .line 231
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->v()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    int-to-long v1, v1

    .line 236
    invoke-static {v0, v1, v2}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 237
    .line 238
    .line 239
    const-string v0, "te_preview_camera_resolution"

    .line 240
    .line 241
    new-instance v1, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 244
    .line 245
    .line 246
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 247
    .line 248
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 249
    .line 250
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 251
    .line 252
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    const-string v2, "*"

    .line 256
    .line 257
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 261
    .line 262
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 263
    .line 264
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 265
    .line 266
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-static {v0, v1}, Ll/hrh0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    const-string v0, "te_record_camera_frame_rate"

    .line 277
    .line 278
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 279
    .line 280
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 281
    .line 282
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 283
    .line 284
    int-to-double v1, v1

    .line 285
    invoke-static {v0, v1, v2}, Ll/hrh0;->a(Ljava/lang/String;D)V

    .line 286
    .line 287
    .line 288
    const-string v0, "te_record_camera_direction"

    .line 289
    .line 290
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 291
    .line 292
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 293
    .line 294
    int-to-long v1, p0

    .line 295
    invoke-static {v0, v1, v2}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 296
    .line 297
    .line 298
    monitor-exit p1

    .line 299
    :cond_7
    :goto_0
    return v6

    .line 300
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 301
    throw p0

    .line 302
    :cond_8
    :goto_2
    const-string p0, "TECameraServer"

    .line 303
    .line 304
    const-string p1, "mCameraSettings has some error"

    .line 305
    .line 306
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    const/16 p0, -0x64

    .line 310
    .line 311
    return p0
.end method

.method public startRecording()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->v0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public startZoom(Lcom/ss/android/ttvecamera/d;FLcom/ss/android/ttvecamera/TECameraSettings$p;)I
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const-string v0, "TECameraServer"

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-string p0, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -108. Reason: invalid CameraClient"

    .line 10
    .line 11
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x6c

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    const-string p0, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -105. Reason: mCameraInstance is null"

    .line 30
    .line 31
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "camera is null, no need to start zoom"

    .line 35
    .line 36
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/16 p0, -0x69

    .line 40
    .line 41
    return p0

    .line 42
    :cond_1
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentZoom:F

    .line 43
    .line 44
    sub-float v0, p2, v0

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget v1, p1, Lcom/ss/android/ttvecamera/c;->l:F

    .line 51
    .line 52
    sub-float v1, p2, v1

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const v2, 0x3dcccccd    # 0.1f

    .line 59
    .line 60
    .line 61
    cmpg-float v1, v1, v2

    .line 62
    .line 63
    const/4 v3, 0x0

    .line 64
    if-gez v1, :cond_2

    .line 65
    .line 66
    iget p2, p1, Lcom/ss/android/ttvecamera/c;->l:F

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    cmpg-float p1, p1, v2

    .line 74
    .line 75
    if-gez p1, :cond_3

    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    goto :goto_0

    .line 79
    :cond_3
    cmpg-float p1, v0, v2

    .line 80
    .line 81
    if-gez p1, :cond_4

    .line 82
    .line 83
    return v3

    .line 84
    :cond_4
    :goto_0
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentZoom:F

    .line 85
    .line 86
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 87
    .line 88
    const/4 v0, 0x1

    .line 89
    invoke-direct {p0, v0, v0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->createMessage(IZLandroid/os/Handler;)Landroid/os/Message;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const/high16 v0, 0x42c80000    # 100.0f

    .line 94
    .line 95
    mul-float/2addr p2, v0

    .line 96
    float-to-int p2, p2

    .line 97
    iput p2, p1, Landroid/os/Message;->arg1:I

    .line 98
    .line 99
    iput-object p3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 104
    .line 105
    .line 106
    return v3
.end method

.method public stop(Lcom/ss/android/ttvecamera/d;)I
    .locals 1

    const/4 v0, 0x0

    .line 169
    invoke-virtual {p0, p1, v0}, Lcom/ss/android/ttvecamera/TECameraServer;->stop(Lcom/ss/android/ttvecamera/d;Z)I

    move-result p0

    return p0
.end method

.method public stop(Lcom/ss/android/ttvecamera/d;Z)I
    .locals 7

    .line 1
    const-string v0, " ==> 2"

    .line 2
    .line 3
    const-string v1, "Invalidate state: "

    .line 4
    .line 5
    const-string v2, "stop, no need to stop capture, state: "

    .line 6
    .line 7
    const-string v3, "TECameraServer"

    .line 8
    .line 9
    new-instance v4, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v5, "stop: client "

    .line 12
    .line 13
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {v3, v4}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_0

    .line 31
    .line 32
    const/16 p0, -0x6c

    .line 33
    .line 34
    return p0

    .line 35
    :cond_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 36
    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    const-string p0, "TECameraServer"

    .line 40
    .line 41
    const-string p1, "stop, mHandler is null!"

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/16 p0, -0x70

    .line 47
    .line 48
    return p0

    .line 49
    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    const/4 v6, 0x0

    .line 58
    if-eq v4, v5, :cond_3

    .line 59
    .line 60
    if-eqz p2, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 65
    .line 66
    .line 67
    :cond_2
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$a1;

    .line 68
    .line 69
    invoke-direct {v0, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$a1;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 73
    .line 74
    .line 75
    if-eqz p2, :cond_6

    .line 76
    .line 77
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraClientCondition:Landroid/os/ConditionVariable;

    .line 78
    .line 79
    const-wide/16 p1, 0x5dc

    .line 80
    .line 81
    invoke-virtual {p0, p1, p2}, Landroid/os/ConditionVariable;->block(J)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_6

    .line 86
    .line 87
    const-string p0, "TECameraServer"

    .line 88
    .line 89
    const-string p1, "Camera stop timeout!"

    .line 90
    .line 91
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 96
    .line 97
    monitor-enter p1

    .line 98
    :try_start_0
    iget p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 99
    .line 100
    const/4 v3, 0x2

    .line 101
    if-ne p2, v3, :cond_4

    .line 102
    .line 103
    const-string p2, "TECameraServer"

    .line 104
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 111
    .line 112
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p2, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    monitor-exit p1

    .line 123
    return v6

    .line 124
    :catchall_0
    move-exception p0

    .line 125
    goto :goto_1

    .line 126
    :cond_4
    iget p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 127
    .line 128
    const/4 v2, 0x3

    .line 129
    if-eq p2, v2, :cond_5

    .line 130
    .line 131
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 132
    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 139
    .line 140
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    const/16 v0, -0x69

    .line 151
    .line 152
    invoke-interface {p2, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 153
    .line 154
    .line 155
    monitor-exit p1

    .line 156
    return v0

    .line 157
    :cond_5
    invoke-virtual {p0, v3}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->x0()V

    .line 163
    .line 164
    .line 165
    monitor-exit p1

    .line 166
    :cond_6
    :goto_0
    return v6

    .line 167
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    throw p0
.end method

.method public stopRecording()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->y0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public stopZoom(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "TECameraServer"

    .line 8
    .line 9
    const-string p1, "[VE_UI_TEST]Failed event: STOP_ZOOM. Code: -108. Reason: invalid CameraClient"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x6c

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eq v0, v1, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 30
    .line 31
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$r;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$r;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const-string p1, "TECameraServer"

    .line 41
    .line 42
    const-string v0, "stopZoom..."

    .line 43
    .line 44
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 48
    .line 49
    monitor-enter p1

    .line 50
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->A0(Lcom/ss/android/ttvecamera/TECameraSettings$p;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    :goto_0
    monitor-exit p1

    .line 63
    :goto_1
    const/4 p0, 0x0

    .line 64
    return p0

    .line 65
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    throw p0
.end method

.method public switchCamera(Lcom/ss/android/ttvecamera/d;ILcom/bytedance/bpea/basics/Cert;)I
    .locals 5

    .line 320
    const-string v0, "Switch camera failed @"

    const-string v1, "TECameraServer"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "switchCamera: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    move-result v1

    const/16 v2, -0x6c

    if-nez v1, :cond_0

    return v2

    .line 322
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    if-nez v1, :cond_1

    .line 323
    const-string p0, "TECameraServer"

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "switchCamera failed: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 324
    :cond_1
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    if-ne v1, p2, :cond_2

    const/16 p0, -0x1a7

    return p0

    :cond_2
    const/4 v1, 0x1

    .line 325
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraSwitchState:Z

    .line 326
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v3

    const/4 v4, 0x0

    if-eq v2, v3, :cond_3

    .line 327
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$b;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$b;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;ILcom/bytedance/bpea/basics/Cert;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_1

    .line 328
    :cond_3
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    monitor-enter p1

    .line 329
    :try_start_0
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    if-ne v2, v1, :cond_4

    .line 330
    iput-boolean v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraSwitchState:Z

    .line 331
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    const-string p2, "Camera is opening, ignore this switch request."

    const/16 p3, -0x69

    invoke-interface {p0, p3, p2}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 332
    monitor-exit p1

    return p3

    :catchall_0
    move-exception p0

    goto/16 :goto_2

    .line 333
    :cond_4
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    iput p2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    const/4 p2, 0x0

    .line 334
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentZoom:F

    .line 335
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    if-nez p2, :cond_6

    .line 336
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->createCameraInstance()Lcom/ss/android/ttvecamera/c;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 337
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    if-nez p2, :cond_6

    .line 338
    iput v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 339
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    const/16 p3, 0xb

    if-ne p2, p3, :cond_5

    .line 340
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    const/16 v0, -0x1ac

    const/4 v1, 0x0

    invoke-interface {p3, p2, v0, v1, v1}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    goto :goto_0

    .line 341
    :cond_5
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    const-string p3, "open : mCameraInstance is null."

    const/16 v0, -0x64

    invoke-interface {p2, v0, p3}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 342
    :goto_0
    iput-boolean v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraSwitchState:Z

    const/4 p0, -0x1

    .line 343
    monitor-exit p1

    return p0

    .line 344
    :cond_6
    iget p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    if-eqz p2, :cond_7

    const/4 p2, 0x4

    .line 345
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 346
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    invoke-virtual {p2, p3}, Lcom/ss/android/ttvecamera/c;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 347
    invoke-virtual {p0, v4}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 348
    :cond_7
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 349
    iput-boolean v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mIsCameraSwitchState:Z

    .line 350
    iget p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    if-gez p2, :cond_8

    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 351
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mBeginTime:J

    .line 352
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    invoke-virtual {p2, v1, p3}, Lcom/ss/android/ttvecamera/c;->W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    move-result p2

    if-eqz p2, :cond_9

    .line 353
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ",face:"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 354
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 355
    invoke-interface {p3, p2, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 356
    :cond_9
    monitor-exit p1

    :goto_1
    return v4

    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public switchCamera(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 8

    .line 1
    const-string v0, "Switch camera failed @"

    .line 2
    .line 3
    const-string v1, "switch mode = "

    .line 4
    .line 5
    const-string v2, "TECameraServer"

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v4, "switchCamera: "

    .line 10
    .line 11
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v2, v3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    const/16 p0, -0x6c

    .line 31
    .line 32
    return p0

    .line 33
    :cond_0
    invoke-direct {p0, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->shouldReOpenCamera(Lcom/ss/android/ttvecamera/TECameraSettings;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    const/16 p0, -0x1a7

    .line 40
    .line 41
    return p0

    .line 42
    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 47
    .line 48
    invoke-virtual {v3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/4 v4, 0x0

    .line 53
    if-eq v2, v3, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 56
    .line 57
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$c;

    .line 58
    .line 59
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$c;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 63
    .line 64
    .line 65
    goto/16 :goto_2

    .line 66
    .line 67
    :cond_2
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 68
    .line 69
    monitor-enter v2

    .line 70
    :try_start_0
    invoke-direct {p0, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->onlySwitchSession(Lcom/ss/android/ttvecamera/TECameraSettings;)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    monitor-exit v2

    .line 77
    return v4

    .line 78
    :catchall_0
    move-exception p0

    .line 79
    goto/16 :goto_3

    .line 80
    .line 81
    :cond_3
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 82
    .line 83
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 84
    .line 85
    iget v5, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 86
    .line 87
    const/4 v6, 0x1

    .line 88
    if-eq v3, v5, :cond_4

    .line 89
    .line 90
    move v3, v6

    .line 91
    goto :goto_0

    .line 92
    :cond_4
    move v3, v4

    .line 93
    :goto_0
    iget v5, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 94
    .line 95
    if-ne v5, v6, :cond_5

    .line 96
    .line 97
    if-nez v3, :cond_5

    .line 98
    .line 99
    const-string p1, "Camera is opening, ignore this switch request..."

    .line 100
    .line 101
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 102
    .line 103
    const/16 p2, -0x69

    .line 104
    .line 105
    invoke-interface {p0, p2, p1}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string p0, "TECameraServer"

    .line 109
    .line 110
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    monitor-exit v2

    .line 114
    return p2

    .line 115
    :cond_5
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 116
    .line 117
    iget v5, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 118
    .line 119
    iget v7, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 120
    .line 121
    if-ne v5, v7, :cond_c

    .line 122
    .line 123
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 124
    .line 125
    iget v5, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 126
    .line 127
    if-ne v3, v5, :cond_c

    .line 128
    .line 129
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 130
    .line 131
    if-nez p1, :cond_8

    .line 132
    .line 133
    const-string p1, "TECameraServer"

    .line 134
    .line 135
    const-string v3, "switch camera, create instance..."

    .line 136
    .line 137
    invoke-static {p1, v3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->createCameraInstance()Lcom/ss/android/ttvecamera/c;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 145
    .line 146
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 147
    .line 148
    if-nez p1, :cond_7

    .line 149
    .line 150
    iput v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 151
    .line 152
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 153
    .line 154
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 155
    .line 156
    const/16 p2, 0xb

    .line 157
    .line 158
    if-ne p1, p2, :cond_6

    .line 159
    .line 160
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 161
    .line 162
    const/16 p2, -0x1ac

    .line 163
    .line 164
    const/4 p3, 0x0

    .line 165
    invoke-interface {p0, p1, p2, p3, p3}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_6
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 170
    .line 171
    const-string p1, "open : mCameraInstance is null."

    .line 172
    .line 173
    const/16 p2, -0x64

    .line 174
    .line 175
    invoke-interface {p0, p2, p1}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :goto_1
    const/4 p0, -0x1

    .line 179
    monitor-exit v2

    .line 180
    return p0

    .line 181
    :cond_7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 182
    .line 183
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer;->satZoomCallback:Lcom/ss/android/ttvecamera/c$f;

    .line 184
    .line 185
    invoke-virtual {p1, v3}, Lcom/ss/android/ttvecamera/c;->q0(Lcom/ss/android/ttvecamera/c$f;)V

    .line 186
    .line 187
    .line 188
    :cond_8
    iget p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 189
    .line 190
    if-eqz p1, :cond_9

    .line 191
    .line 192
    const/4 p1, 0x4

    .line 193
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 197
    .line 198
    invoke-virtual {p1, p3}, Lcom/ss/android/ttvecamera/c;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, v4}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 202
    .line 203
    .line 204
    :cond_9
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 205
    .line 206
    const/4 p1, 0x0

    .line 207
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentZoom:F

    .line 208
    .line 209
    invoke-virtual {p0, v6}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 210
    .line 211
    .line 212
    iget p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 213
    .line 214
    if-gez p1, :cond_a

    .line 215
    .line 216
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 217
    .line 218
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 219
    .line 220
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mRetryCnt:I

    .line 221
    .line 222
    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 223
    .line 224
    .line 225
    move-result-wide p1

    .line 226
    iput-wide p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mBeginTime:J

    .line 227
    .line 228
    const-string p1, "TECameraServer"

    .line 229
    .line 230
    new-instance p2, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 236
    .line 237
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 238
    .line 239
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 250
    .line 251
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 252
    .line 253
    invoke-virtual {p1, p2, p3}, Lcom/ss/android/ttvecamera/c;->W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-eqz p1, :cond_b

    .line 258
    .line 259
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 260
    .line 261
    new-instance p3, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 267
    .line 268
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 269
    .line 270
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    const-string v0, ",face:"

    .line 274
    .line 275
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 279
    .line 280
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 281
    .line 282
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    const-string v0, " "

    .line 286
    .line 287
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraSettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 291
    .line 292
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 293
    .line 294
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-interface {p2, p1, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 306
    .line 307
    .line 308
    :cond_b
    monitor-exit v2

    .line 309
    return v4

    .line 310
    :cond_c
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    invoke-direct {p0, p3}, Lcom/ss/android/ttvecamera/TECameraServer;->close(Lcom/bytedance/bpea/basics/Cert;)I

    .line 312
    .line 313
    .line 314
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer;->open(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 315
    .line 316
    .line 317
    :goto_2
    return v4

    .line 318
    :goto_3
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 319
    throw p0
.end method

.method public switchCameraMode(Lcom/ss/android/ttvecamera/d;I)I
    .locals 5

    .line 1
    const-string v0, " ==> 3"

    .line 2
    .line 3
    const-string v1, "Invalidate state: "

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    const/16 p0, -0x6c

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v2, p1, Lcom/ss/android/ttvecamera/d;->a:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 15
    .line 16
    iget v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 17
    .line 18
    const/4 v4, 0x1

    .line 19
    if-eq v3, v4, :cond_5

    .line 20
    .line 21
    if-eq p2, v4, :cond_1

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    if-eq p2, v3, :cond_1

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_1
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-ne v2, p2, :cond_2

    .line 33
    .line 34
    return v3

    .line 35
    :cond_2
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 40
    .line 41
    invoke-virtual {v4}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    if-eq v2, v4, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 48
    .line 49
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$r0;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$r0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    const-string p1, "TECameraServer"

    .line 59
    .line 60
    const-string v2, "switchCameraMode"

    .line 61
    .line 62
    invoke-static {p1, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 66
    .line 67
    monitor-enter p1

    .line 68
    :try_start_0
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 69
    .line 70
    const/4 v4, 0x3

    .line 71
    if-eq v2, v4, :cond_4

    .line 72
    .line 73
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 74
    .line 75
    new-instance v2, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 81
    .line 82
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const/16 v0, -0x69

    .line 93
    .line 94
    invoke-interface {p2, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    monitor-exit p1

    .line 98
    return v0

    .line 99
    :catchall_0
    move-exception p0

    .line 100
    goto :goto_1

    .line 101
    :cond_4
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 102
    .line 103
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->B0(I)V

    .line 104
    .line 105
    .line 106
    monitor-exit p1

    .line 107
    :goto_0
    return v3

    .line 108
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    throw p0

    .line 110
    :cond_5
    :goto_2
    const/16 p0, -0x64

    .line 111
    .line 112
    return p0
.end method

.method public switchFlashMode(Lcom/ss/android/ttvecamera/d;I)I
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$l0;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$l0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v1, "switchFlashMode: "

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter p1

    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 60
    .line 61
    invoke-virtual {v0, p2}, Lcom/ss/android/ttvecamera/c;->C0(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 65
    .line 66
    const-string v1, ""

    .line 67
    .line 68
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 69
    .line 70
    const/16 v2, 0x74

    .line 71
    .line 72
    invoke-interface {v0, v2, p2, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_2

    .line 78
    :cond_2
    :goto_0
    monitor-exit p1

    .line 79
    :goto_1
    const/4 p0, 0x0

    .line 80
    return p0

    .line 81
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    throw p0
.end method

.method public takePicture(Lcom/ss/android/ttvecamera/d;IILcom/ss/android/ttvecamera/TECameraSettings$l;)I
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/16 p0, -0x6c

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$f;

    .line 13
    .line 14
    invoke-direct {v0, p0, p4, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$f;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/TECameraSettings$l;II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public takePicture(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$l;)I
    .locals 1

    .line 22
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    move-result p1

    if-nez p1, :cond_0

    const/16 p0, -0x6c

    return p0

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/ss/android/ttvecamera/TECameraServer$g;

    invoke-direct {v0, p0, p2}, Lcom/ss/android/ttvecamera/TECameraServer$g;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/TECameraSettings$l;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 p0, 0x0

    return p0
.end method

.method public toggleTorch(Lcom/ss/android/ttvecamera/d;Z)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "TECameraServer"

    .line 8
    .line 9
    const-string p1, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -108. Reason: invalid CameraClient"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x6c

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eq v0, v1, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 30
    .line 31
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$k0;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer$k0;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const-string p1, "TECameraServer"

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "toggleTorch: "

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 60
    .line 61
    monitor-enter p1

    .line 62
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 67
    .line 68
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/c;->F0(Z)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    goto :goto_2

    .line 74
    :cond_2
    :goto_0
    monitor-exit p1

    .line 75
    :goto_1
    const/4 p0, 0x0

    .line 76
    return p0

    .line 77
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    throw p0
.end method

.method public upExposureCompensation(Lcom/ss/android/ttvecamera/d;)V
    .locals 3

    .line 1
    const-string v0, "Can not set ec on state : "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eq v1, v2, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$x;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer$x;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string p1, "TECameraServer"

    .line 34
    .line 35
    const-string v1, "upExposureCompensation..."

    .line 36
    .line 37
    invoke-static {p1, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    if-eq v1, v2, :cond_2

    .line 47
    .line 48
    iget v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 49
    .line 50
    const/4 v2, 0x2

    .line 51
    if-eq v1, v2, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 54
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 61
    .line 62
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/16 v0, -0x69

    .line 70
    .line 71
    invoke-interface {v1, v0, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    monitor-exit p1

    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->s()Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraObserver:Lcom/ss/android/ttvecamera/d$b;

    .line 87
    .line 88
    const-string v0, "upExposureCompensation get ec info failed"

    .line 89
    .line 90
    const/16 v1, -0x70

    .line 91
    .line 92
    invoke-interface {p0, v1, v0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    monitor-exit p1

    .line 96
    return-void

    .line 97
    :cond_3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 98
    .line 99
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 100
    .line 101
    add-int/lit8 v0, v0, 0x1

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/c;->j0(I)Z

    .line 104
    .line 105
    .line 106
    monitor-exit p1

    .line 107
    return-void

    .line 108
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    throw p0
.end method

.method public updateCameraAlgorithmParam(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECameraServer"

    .line 6
    .line 7
    const-string p1, "updateCameraAlgorithmParam failed mCameraInstance is null!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/c;->G0(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public updateCameraState(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 2
    .line 3
    const-string v1, "TECameraServer"

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "No need update state: "

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "[updateCameraState]: "

    .line 28
    .line 29
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, " -> "

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCurrentCameraState:I

    .line 53
    .line 54
    return-void
.end method

.method public zoomV2(Lcom/ss/android/ttvecamera/d;FLcom/ss/android/ttvecamera/TECameraSettings$p;)I
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/TECameraServer;->assertClient(Lcom/ss/android/ttvecamera/d;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "TECameraServer"

    .line 8
    .line 9
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -108. Reason: invalid CameraClient"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x6c

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mHandler:Landroid/os/Handler;

    .line 31
    .line 32
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraServer$s;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer$s;-><init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;FLcom/ss/android/ttvecamera/TECameraSettings$p;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const-string p1, "TECameraServer"

    .line 42
    .line 43
    const-string v0, "zoomV2..."

    .line 44
    .line 45
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mStateLock:Ljava/lang/Object;

    .line 49
    .line 50
    monitor-enter p1

    .line 51
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 56
    .line 57
    invoke-virtual {v0, p2, p3}, Lcom/ss/android/ttvecamera/c;->H0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    :goto_0
    iget-boolean p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstZoom:Z

    .line 64
    .line 65
    if-eqz p2, :cond_3

    .line 66
    .line 67
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraEvent:Lcom/ss/android/ttvecamera/c$a;

    .line 68
    .line 69
    const-string p3, "zoomV2"

    .line 70
    .line 71
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mCameraInstance:Lcom/ss/android/ttvecamera/c;

    .line 72
    .line 73
    const/16 v1, 0x72

    .line 74
    .line 75
    invoke-interface {p2, v1, v2, p3, v0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mFirstZoom:Z

    .line 79
    .line 80
    :cond_3
    monitor-exit p1

    .line 81
    :goto_1
    return v2

    .line 82
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    throw p0
.end method
