.class public Ll/x8p0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/x8p0;->b:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/x8p0;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/x8p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    if-ne p1, p0, :cond_0

    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    iput-object p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8p0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/x8p0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/x8p0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Ll/x8p0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 11
    .line 12
    return-void
.end method
