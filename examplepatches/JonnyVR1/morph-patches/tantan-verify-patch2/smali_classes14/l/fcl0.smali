.class public Ll/fcl0;
.super Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;
.source "SourceFile"


# instance fields
.field public final e:Landroid/widget/FrameLayout;

.field public final f:Landroid/widget/FrameLayout;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:Ll/aam;

.field public n:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;ZLjava/lang/String;Ll/aam;)V
    .locals 2

    .line 1
    const/16 v0, 0xcd

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "0"

    .line 8
    .line 9
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/fcl0;->g:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p3, p0, Ll/fcl0;->h:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p4, p0, Ll/fcl0;->i:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p8, p0, Ll/fcl0;->e:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    iput-object p5, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->d:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p6, p0, Ll/fcl0;->k:Ljava/lang/String;

    .line 23
    .line 24
    iput-boolean p10, p0, Ll/fcl0;->l:Z

    .line 25
    .line 26
    iput-object p7, p0, Ll/fcl0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 27
    .line 28
    iput-object p9, p0, Ll/fcl0;->f:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    iput-object p11, p0, Ll/fcl0;->j:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p12, p0, Ll/fcl0;->m:Ll/aam;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fcl0;->l:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;->VIDEO_CHAT_HOST:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;->VIDEO_CHAT_CALLER:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;

    .line 9
    .line 10
    return-object p0
.end method
