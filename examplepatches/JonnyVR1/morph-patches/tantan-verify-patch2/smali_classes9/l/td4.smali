.class public final synthetic Ll/td4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ue4;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;


# direct methods
.method public synthetic constructor <init>(Ll/ue4;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/td4;->a:Ll/ue4;

    iput-object p2, p0, Ll/td4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/td4;->a:Ll/ue4;

    iget-object p0, p0, Ll/td4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->a(Ll/ue4;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Landroid/view/View;)V

    return-void
.end method
