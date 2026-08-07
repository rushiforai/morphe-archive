.class public Ll/cpd0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;
.source "SourceFile"


# instance fields
.field public transient j:Landroid/widget/FrameLayout;

.field public transient k:Landroid/widget/FrameLayout;

.field public l:Ljava/lang/String;

.field public m:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;)V
    .locals 1

    .line 1
    const/4 p4, 0x0

    .line 2
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p4

    .line 6
    const-string v0, "0"

    .line 7
    .line 8
    invoke-direct {p0, p1, v0, p4}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->f:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p6, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->h:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p7, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p8, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->i:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p9, p0, Ll/cpd0;->j:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    iput-object p10, p0, Ll/cpd0;->k:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    iput-object p2, p0, Ll/cpd0;->l:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p11, p0, Ll/cpd0;->m:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_AUDIENCE_RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    return-object p0
.end method
