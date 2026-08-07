.class public final synthetic Ll/jms;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jms;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jms;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    return-void
.end method
