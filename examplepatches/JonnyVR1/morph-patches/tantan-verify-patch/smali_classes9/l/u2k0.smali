.class public final synthetic Ll/u2k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftWebView;

.field public final synthetic b:Ll/a3k0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftWebView;Ll/a3k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u2k0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftWebView;

    iput-object p2, p0, Ll/u2k0;->b:Ll/a3k0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u2k0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftWebView;

    iget-object p0, p0, Ll/u2k0;->b:Ll/a3k0;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftWebView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftWebView;Ll/a3k0;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
