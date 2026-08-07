.class public final synthetic Ll/l2k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k2k;


# direct methods
.method public synthetic constructor <init>(Ll/k2k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2k;->a:Ll/k2k;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2k;->a:Ll/k2k;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;->U(Ll/k2k;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    return-void
.end method
