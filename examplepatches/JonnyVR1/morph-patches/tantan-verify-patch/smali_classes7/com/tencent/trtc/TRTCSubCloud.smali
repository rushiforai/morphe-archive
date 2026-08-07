.class public Lcom/tencent/trtc/TRTCSubCloud;
.super Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/trtc/TRTCSubCloud$a;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.tencent.trtc.TRTCSubCloud"


# instance fields
.field protected mMainCloud:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;",
            ">;"
        }
    .end annotation
.end field

.field private mVolumeLevelCalTask:Lcom/tencent/trtc/TRTCSubCloud$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/ref/WeakReference;Lcom/tencent/liteav/basic/util/e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;",
            ">;",
            "Lcom/tencent/liteav/basic/util/e;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;-><init>(Landroid/content/Context;Lcom/tencent/liteav/basic/util/e;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud;->mMainCloud:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud;->mVolumeLevelCalTask:Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 8
    .line 9
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 10
    .line 11
    const/4 p3, 0x1

    .line 12
    iput-boolean p3, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalAudio:Z

    .line 13
    .line 14
    iput-boolean p3, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalVideo:Z

    .line 15
    .line 16
    iput-object p2, p0, Lcom/tencent/trtc/TRTCSubCloud;->mMainCloud:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/trtc/TRTCSubCloud;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tencent/trtc/TRTCSubCloud;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1000(Lcom/tencent/trtc/TRTCSubCloud;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1100(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1500(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1602(Lcom/tencent/trtc/TRTCSubCloud;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsExitOldRoom:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1700(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2000(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2100(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2200(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2300()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/trtc/TRTCSubCloud;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$2402(Lcom/tencent/trtc/TRTCSubCloud;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$2500(Lcom/tencent/trtc/TRTCSubCloud;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$2602(Lcom/tencent/trtc/TRTCSubCloud;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$2700(Lcom/tencent/trtc/TRTCSubCloud;III)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeCreateContext(III)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic access$2800(Lcom/tencent/trtc/TRTCSubCloud;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateAppScene(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2900(Lcom/tencent/trtc/TRTCSubCloud;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$300(Lcom/tencent/trtc/TRTCSubCloud;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$3000(Lcom/tencent/trtc/TRTCSubCloud;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPriorStreamType:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3100(Lcom/tencent/trtc/TRTCSubCloud;JI)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetPriorRemoteVideoStreamType(JI)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$3200(Lcom/tencent/trtc/TRTCSubCloud;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$3300(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$3400(Lcom/tencent/trtc/TRTCSubCloud;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$3500(Lcom/tencent/trtc/TRTCSubCloud;JILjava/lang/String;Ljava/lang/String;[B)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeInit(JILjava/lang/String;Ljava/lang/String;[B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3600(Lcom/tencent/trtc/TRTCSubCloud;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$3700(Lcom/tencent/trtc/TRTCSubCloud;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3800(Lcom/tencent/trtc/TRTCSubCloud;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvMode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$3900(Lcom/tencent/trtc/TRTCSubCloud;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p17}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeEnterRoom(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$400(Lcom/tencent/trtc/TRTCSubCloud;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeDestroyContext(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4002(Lcom/tencent/trtc/TRTCSubCloud;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$4102(Lcom/tencent/trtc/TRTCSubCloud;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTargetRole:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$4200(Lcom/tencent/trtc/TRTCSubCloud;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startCollectStatus()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4302(Lcom/tencent/trtc/TRTCSubCloud;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastStateTimeMs:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$4400(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$4500(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$4600(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$4700(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$4800(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$4900(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$5000(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$502(Lcom/tencent/trtc/TRTCSubCloud;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$5100(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5200(Lcom/tencent/trtc/TRTCSubCloud;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopRemoteRender(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5300(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$5400(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5500(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5600(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5700(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5800(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$5900(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6000(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/tencent/trtc/TRTCSubCloud;Lcom/tencent/trtc/TRTCCloudListener;)Lcom/tencent/trtc/TRTCCloudListener;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$6100(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6200(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$6300(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/trtc/TRTCCloudListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$6400(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6500(Lcom/tencent/trtc/TRTCSubCloud;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$6600(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/trtc/TRTCSubCloud$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud;->mVolumeLevelCalTask:Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$6700(Lcom/tencent/trtc/TRTCSubCloud;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$6800(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/basic/util/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$6900(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setSEIPayloadType(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7000(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteRemoteAudioInSpeaker(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$702(Lcom/tencent/trtc/TRTCSubCloud;Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$7100(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setPerformanceMode(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7200(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendJsonCmd(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7300(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updatePrivateMapKey(Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7400(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7500(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/tencent/trtc/TRTCSubCloud;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/tencent/trtc/TRTCSubCloud;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSubClouds:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public ConnectOtherRoom(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->ConnectOtherRoom(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public DisconnectOtherRoom()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->DisconnectOtherRoom()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public callExperimentalAPI(Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, "params"

    .line 2
    .line 3
    const-string v1, "api"

    .line 4
    .line 5
    const-string v2, "callExperimentalAPI[lack api or illegal type]: "

    .line 6
    .line 7
    const-string v3, ""

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v5, "callExperimentalAPI  "

    .line 14
    .line 15
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v5, ", roomid = "

    .line 22
    .line 23
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 27
    .line 28
    iget-wide v6, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 29
    .line 30
    const-wide/16 v8, -0x1

    .line 31
    .line 32
    cmp-long v8, v6, v8

    .line 33
    .line 34
    if-eqz v8, :cond_0

    .line 35
    .line 36
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v5, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v4, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v5, "callExperimentalAPI:%s"

    .line 59
    .line 60
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v5, " self:"

    .line 72
    .line 73
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    const/4 v5, 0x0

    .line 88
    const/4 v6, 0x1

    .line 89
    invoke-static {v6, v4, v3, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 90
    .line 91
    .line 92
    :cond_1
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 93
    .line 94
    invoke-direct {v4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-nez v5, :cond_2

    .line 102
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_2
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-nez v1, :cond_3

    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 131
    .line 132
    .line 133
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    goto :goto_1

    .line 135
    :catch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v1, "callExperimentalAPI[failed]: "

    .line 138
    .line 139
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    const/4 v0, 0x0

    .line 153
    :goto_1
    const-string v1, "setEncodedDataProcessingListener"

    .line 154
    .line 155
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_4

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setEncodedDataProcessingListener(Lorg/json/JSONObject;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_4
    new-instance v1, Lcom/tencent/trtc/TRTCSubCloud$8;

    .line 166
    .line 167
    invoke-direct {v1, p0, v3, v0, p1}, Lcom/tencent/trtc/TRTCSubCloud$8;-><init>(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public collectCustomCaptureFps()V
    .locals 0

    return-void
.end method

.method public createSubCloud()Lcom/tencent/trtc/TRTCCloud;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/trtc/TRTCSubCloud$1;-><init>(Lcom/tencent/trtc/TRTCSubCloud;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public enableAudioEarMonitoring(Z)V
    .locals 0

    return-void
.end method

.method public enableAudioVolumeEvaluation(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioVolumeEvaluation(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public enableCustomAudioCapture(Z)V
    .locals 0

    return-void
.end method

.method public enableCustomVideoCapture(Z)V
    .locals 0

    return-void
.end method

.method public enableEncSmallVideoStream(ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public enableTorch(Z)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enterRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V
    .locals 12

    .line 1
    const-string v0, "strGroupId"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, "enter room, param nil!"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, -0xcf4

    .line 11
    .line 12
    const-string p2, "enter room param null"

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 19
    .line 20
    invoke-direct {v5, p1}, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;-><init>(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;)V

    .line 21
    .line 22
    .line 23
    iget p1, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    iget-object p1, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    :cond_1
    move-object v1, p0

    .line 44
    goto/16 :goto_1

    .line 45
    .line 46
    :cond_2
    iget p1, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->roomId:I

    .line 47
    .line 48
    int-to-long v1, p1

    .line 49
    const-wide v3, 0xffffffffL

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    and-long/2addr v3, v1

    .line 55
    const-wide/16 v1, 0x0

    .line 56
    .line 57
    cmp-long v1, v3, v1

    .line 58
    .line 59
    const-string v2, "room id invalid."

    .line 60
    .line 61
    const/16 v6, -0xcf6

    .line 62
    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string p2, "enter room, room id "

    .line 68
    .line 69
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p2, " error"

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v6, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iget-object v1, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->businessInfo:Ljava/lang/String;

    .line 92
    .line 93
    const/4 v7, -0x1

    .line 94
    const-string v8, ""

    .line 95
    .line 96
    if-ne p1, v7, :cond_5

    .line 97
    .line 98
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_5

    .line 103
    .line 104
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 105
    .line 106
    iget-object v1, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->businessInfo:Ljava/lang/String;

    .line 107
    .line 108
    invoke-direct {p1, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    const-string v0, "Role"

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_4

    .line 128
    .line 129
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :cond_4
    move-object v11, v8

    .line 134
    move-object v8, v1

    .line 135
    move-object v1, v11

    .line 136
    goto :goto_0

    .line 137
    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    const-string v0, "enter room, room id error, busInfo "

    .line 140
    .line 141
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->businessInfo:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    move-object v1, v8

    .line 157
    :goto_0
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_5

    .line 162
    .line 163
    invoke-virtual {p0, v6, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_5
    move-object v7, v1

    .line 168
    move-object v2, v8

    .line 169
    iget v8, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->role:I

    .line 170
    .line 171
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 172
    .line 173
    .line 174
    move-result-wide v9

    .line 175
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud$2;

    .line 176
    .line 177
    move-object v1, p0

    .line 178
    move v6, p2

    .line 179
    invoke-direct/range {v0 .. v10}, Lcom/tencent/trtc/TRTCSubCloud$2;-><init>(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;JLcom/tencent/trtc/TRTCCloudDef$TRTCParams;ILjava/lang/String;IJ)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    const-string p1, "enterRoom param invalid:"

    .line 189
    .line 190
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget p0, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 204
    .line 205
    if-nez p0, :cond_6

    .line 206
    .line 207
    const/16 p0, -0xcf5

    .line 208
    .line 209
    const-string p1, "enter room sdkAppId invalid."

    .line 210
    .line 211
    invoke-virtual {v1, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 212
    .line 213
    .line 214
    :cond_6
    iget-object p0, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 215
    .line 216
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-eqz p0, :cond_7

    .line 221
    .line 222
    const/16 p0, -0xcf8

    .line 223
    .line 224
    const-string p1, "enter room userSig invalid."

    .line 225
    .line 226
    invoke-virtual {v1, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_7
    iget-object p0, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    if-eqz p0, :cond_8

    .line 236
    .line 237
    const/16 p0, -0xcf7

    .line 238
    .line 239
    const-string p1, "enter room userId invalid."

    .line 240
    .line 241
    invoke-virtual {v1, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :cond_8
    return-void
.end method

.method public exitRoom()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud$3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/trtc/TRTCSubCloud$3;-><init>(Lcom/tencent/trtc/TRTCSubCloud;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public exitRoomInternal(ZLjava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "exitRoomInternal reqExit: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", reason: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p2, ", mRoomState: "

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 37
    .line 38
    if-nez p2, :cond_0

    .line 39
    .line 40
    const-string p1, "exitRoom ignore when no in room"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    const/4 p2, 0x0

    .line 47
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopCollectStatus()V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 53
    .line 54
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud$4;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lcom/tencent/trtc/TRTCSubCloud$4;-><init>(Lcom/tencent/trtc/TRTCSubCloud;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 60
    .line 61
    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    iget-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeExitRoom(J)I

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->clear()V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 3
    .line 4
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->finalize()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getAudioCaptureVolume()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getAudioPlayoutVolume()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getBGMDuration(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getBeautyManager()Lcom/tencent/liteav/beauty/TXBeautyManager;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public isCameraAutoFocusFaceModeSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraFocusPositionInPreviewSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraTorchSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public muteAllRemoteAudio(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteAllRemoteAudio(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public muteAllRemoteVideoStreams(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteAllRemoteVideoStreams(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public muteLocalAudio(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud$7;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/trtc/TRTCSubCloud$7;-><init>(Lcom/tencent/trtc/TRTCSubCloud;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteLocalVideo(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud$6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/trtc/TRTCSubCloud$6;-><init>(Lcom/tencent/trtc/TRTCSubCloud;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteRemoteAudio(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteRemoteAudio(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public muteRemoteVideoStream(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteRemoteVideoStream(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAudioQosChanged(III)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud;->mMainCloud:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAudioQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;III)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onIdrFpsChanged(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud;->mMainCloud:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onIdrFpsChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onVideoConfigChanged(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud;->mMainCloud:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onVideoConfigChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onVideoQosChanged(IIIIIII)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud;->mMainCloud:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v1, p0

    .line 12
    move v2, p1

    .line 13
    move v3, p2

    .line 14
    move v4, p3

    .line 15
    move v5, p4

    .line 16
    move v6, p5

    .line 17
    move v7, p6

    .line 18
    move/from16 v8, p7

    .line 19
    .line 20
    invoke-virtual/range {v0 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onVideoQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIII)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public pauseAudioEffect(I)V
    .locals 0

    return-void
.end method

.method public pauseBGM()V
    .locals 0

    return-void
.end method

.method public playAudioEffect(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V
    .locals 0

    return-void
.end method

.method public playBGM(Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$BGMNotify;)V
    .locals 0

    return-void
.end method

.method public resumeAudioEffect(I)V
    .locals 0

    return-void
.end method

.method public resumeBGM()V
    .locals 0

    return-void
.end method

.method public selectMotionTmpl(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public sendCustomAudioData(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
    .locals 0

    return-void
.end method

.method public sendCustomCmdMsg(I[BZZ)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendCustomCmdMsg(I[BZZ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public sendCustomVideoData(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 0

    return-void
.end method

.method public sendSEIMsg([BI)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendSEIMsg([BI)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setAllAudioEffectsVolume(I)V
    .locals 0

    return-void
.end method

.method public setAudioCaptureVolume(I)V
    .locals 0

    return-void
.end method

.method public setAudioEffectVolume(II)V
    .locals 0

    return-void
.end method

.method public setAudioFrameListener(Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V
    .locals 0

    return-void
.end method

.method public setAudioPlayoutVolume(I)V
    .locals 0

    return-void
.end method

.method public setAudioRoute(I)V
    .locals 0

    return-void
.end method

.method public setBGMPlayoutVolume(I)V
    .locals 0

    return-void
.end method

.method public setBGMPosition(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setBGMPublishVolume(I)V
    .locals 0

    return-void
.end method

.method public setBGMVolume(I)V
    .locals 0

    return-void
.end method

.method public setBeautyStyle(IIII)V
    .locals 0

    return-void
.end method

.method public setChinLevel(I)V
    .locals 0

    return-void
.end method

.method public setDebugViewMargin(Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setDebugViewMargin(Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setDefaultStreamRecvMode(ZZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setDefaultStreamRecvMode(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setEyeScaleLevel(I)V
    .locals 0

    return-void
.end method

.method public setFaceShortLevel(I)V
    .locals 0

    return-void
.end method

.method public setFaceSlimLevel(I)V
    .locals 0

    return-void
.end method

.method public setFaceVLevel(I)V
    .locals 0

    return-void
.end method

.method public setFilter(Landroid/graphics/Bitmap;)V
    .locals 0

    return-void
.end method

.method public setFilterConcentration(F)V
    .locals 0

    return-void
.end method

.method public setFocusPosition(II)V
    .locals 0

    return-void
.end method

.method public setGSensorMode(I)V
    .locals 0

    return-void
.end method

.method public setGreenScreenFile(Ljava/lang/String;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setListener(Lcom/tencent/trtc/TRTCCloudListener;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setListener(Lcom/tencent/trtc/TRTCCloudListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setListenerHandler(Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setListenerHandler(Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setLocalVideoRenderListener(IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public setLocalViewFillMode(I)V
    .locals 0

    return-void
.end method

.method public setLocalViewMirror(I)V
    .locals 0

    return-void
.end method

.method public setLocalViewRotation(I)V
    .locals 0

    return-void
.end method

.method public setMicVolumeOnMixing(I)V
    .locals 0

    return-void
.end method

.method public setMixTranscodingConfig(Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setMixTranscodingConfig(Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMotionMute(Z)V
    .locals 0

    return-void
.end method

.method public setNetworkQosParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V
    .locals 0

    return-void
.end method

.method public setNoseSlimLevel(I)V
    .locals 0

    return-void
.end method

.method public setPriorRemoteVideoStreamType(I)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setPriorRemoteVideoStreamType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setRemoteAudioVolume(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteAudioVolume(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRemoteSubStreamViewFillMode(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSubStreamViewFillMode(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRemoteSubStreamViewRotation(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSubStreamViewRotation(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setRemoteVideoStreamType(Ljava/lang/String;I)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoStreamType(Ljava/lang/String;I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setRemoteViewFillMode(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteViewFillMode(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRemoteViewRotation(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteViewRotation(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setReverbType(I)V
    .locals 0

    return-void
.end method

.method public setSystemVolumeType(I)V
    .locals 0

    return-void
.end method

.method public setVideoEncoderMirror(Z)V
    .locals 0

    return-void
.end method

.method public setVideoEncoderParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V
    .locals 0

    return-void
.end method

.method public setVideoEncoderRotation(I)V
    .locals 0

    return-void
.end method

.method public setVoiceChangerType(I)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setWatermark(Landroid/graphics/Bitmap;IFFF)V
    .locals 0

    return-void
.end method

.method public setZoom(I)V
    .locals 0

    return-void
.end method

.method public showDebugView(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->showDebugView(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public snapshotVideo(Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;)V
    .locals 2

    .line 1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "snapshotVideo user:%s streamType:%d"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/tencent/trtc/TRTCSubCloud$5;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/trtc/TRTCSubCloud$5;-><init>(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public startAudioRecording(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioRecordingParams;)I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public startLocalAudio()V
    .locals 0

    return-void
.end method

.method public startLocalPreview(ZLcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    return-void
.end method

.method public startPublishCDNStream(Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startPublishCDNStream(Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startPublishing(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startPublishing(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startRemoteSubStreamView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startRemoteSubStreamView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startRemoteView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startRemoteView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startSpeedTest(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public startVolumeLevelCal(Z)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 5
    .line 6
    invoke-static {p1, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableAudioVolumeEvaluation(ZI)Z

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud;->mVolumeLevelCalTask:Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    new-instance p1, Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/tencent/trtc/TRTCSubCloud$a;-><init>(Lcom/tencent/trtc/TRTCSubCloud;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud;->mVolumeLevelCalTask:Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 23
    .line 24
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 25
    .line 26
    int-to-long v1, p0

    .line 27
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    const/4 p1, 0x0

    .line 32
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud;->mVolumeLevelCalTask:Lcom/tencent/trtc/TRTCSubCloud$a;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 36
    .line 37
    return-void
.end method

.method public stopAllAudioEffects()V
    .locals 0

    return-void
.end method

.method public stopAllRemoteView()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopAllRemoteView()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public stopAudioEffect(I)V
    .locals 0

    return-void
.end method

.method public stopAudioRecording()V
    .locals 0

    return-void
.end method

.method public stopBGM()V
    .locals 0

    return-void
.end method

.method public stopLocalAudio()V
    .locals 0

    return-void
.end method

.method public stopLocalPreview()V
    .locals 0

    return-void
.end method

.method public stopPublishCDNStream()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopPublishCDNStream()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public stopPublishing()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopPublishing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public stopRemoteSubStreamView(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopRemoteSubStreamView(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public stopRemoteView(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopRemoteView(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public stopSpeedTest()V
    .locals 0

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public switchCamera()V
    .locals 0

    return-void
.end method

.method public switchRole(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->switchRole(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
