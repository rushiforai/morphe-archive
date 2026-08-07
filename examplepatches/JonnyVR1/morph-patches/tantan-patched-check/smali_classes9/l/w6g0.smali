.class public final synthetic Ll/w6g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w6g0;->a:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w6g0;->a:Ljava/lang/StringBuilder;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->e(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;)V

    return-void
.end method
