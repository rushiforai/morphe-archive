.class public Ll/wa10;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;
.source "SourceFile"


# instance fields
.field public j:Ljava/lang/String;

.field public final k:Z

.field public transient l:Landroid/widget/FrameLayout;

.field public transient m:Landroid/widget/FrameLayout;

.field public n:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLandroid/widget/FrameLayout;Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    const/4 p3, 0x3

    .line 2
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p3

    .line 6
    const-string v0, "0"

    .line 7
    .line 8
    invoke-direct {p0, p1, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->f:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->h:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p6, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p8, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->i:Ljava/lang/String;

    .line 20
    .line 21
    iput-boolean p10, p0, Ll/wa10;->k:Z

    .line 22
    .line 23
    iput-object p9, p0, Ll/wa10;->j:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p11, p0, Ll/wa10;->l:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    iput-object p12, p0, Ll/wa10;->m:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    iput p7, p0, Ll/wa10;->n:I

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    return-object p0
.end method
