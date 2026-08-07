.class public final synthetic Ll/bks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bks;->a:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bks;->a:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    invoke-static {p0, p1}, Ll/eks;->c(Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
