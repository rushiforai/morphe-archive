.class public final synthetic Ll/bms;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bms;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    iput-object p2, p0, Ll/bms;->b:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bms;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    iget-object p0, p0, Ll/bms;->b:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->i0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V

    return-void
.end method
