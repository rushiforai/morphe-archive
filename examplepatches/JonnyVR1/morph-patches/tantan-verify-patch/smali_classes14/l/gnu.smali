.class public final synthetic Ll/gnu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nsv;


# direct methods
.method public synthetic constructor <init>(Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gnu;->a:Ll/nsv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnu;->a:Ll/nsv;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftTrayView;->k0(Ll/nsv;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
