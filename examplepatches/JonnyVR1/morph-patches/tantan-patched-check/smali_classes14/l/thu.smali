.class public final synthetic Ll/thu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/liu;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;


# direct methods
.method public synthetic constructor <init>(Ll/liu;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/thu;->a:Ll/liu;

    iput-object p2, p0, Ll/thu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/thu;->a:Ll/liu;

    iget-object p0, p0, Ll/thu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c(Ll/liu;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Landroid/view/View;)V

    return-void
.end method
