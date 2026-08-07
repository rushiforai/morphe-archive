.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$a;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->c(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;JJLcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 2
    .line 3
    iput-object p6, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->playGapSeconds:J

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->url:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;JLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onTick(J)V
    .locals 0

    return-void
.end method
