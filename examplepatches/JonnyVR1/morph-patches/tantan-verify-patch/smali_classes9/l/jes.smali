.class public final synthetic Ll/jes;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

.field public final synthetic b:Ll/z20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jes;->a:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    iput-object p2, p0, Ll/jes;->b:Ll/z20;

    iput-object p3, p0, Ll/jes;->c:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jes;->a:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    iget-object v1, p0, Ll/jes;->b:Ll/z20;

    iget-object p0, p0, Ll/jes;->c:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->h0(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Landroid/view/View;)V

    return-void
.end method
