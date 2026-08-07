.class public final synthetic Ll/lvp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lvp0;->a:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lvp0;->a:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->b(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;Landroid/view/View;)V

    return-void
.end method
