.class public final synthetic Ll/rkj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rkj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;

    iput-object p2, p0, Ll/rkj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rkj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;

    iget-object p0, p0, Ll/rkj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method
