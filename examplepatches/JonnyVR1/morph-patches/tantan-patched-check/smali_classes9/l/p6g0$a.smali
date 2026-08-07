.class public Ll/p6g0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aiv$a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/p6g0;->R3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/p6g0;


# direct methods
.method public constructor <init>(Ll/p6g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p6g0$a;->a:Ll/p6g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/p6g0$a;->a:Ll/p6g0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/p6g0;->O3(Ll/p6g0;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->y()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/p6g0$a;->a:Ll/p6g0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->dismissEffectsDanmakuDialog()Ll/v3f$c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method
