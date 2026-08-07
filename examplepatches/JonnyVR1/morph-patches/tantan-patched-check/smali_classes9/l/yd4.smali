.class public final synthetic Ll/yd4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zd4;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;


# direct methods
.method public synthetic constructor <init>(Ll/zd4;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yd4;->a:Ll/zd4;

    iput-object p2, p0, Ll/yd4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yd4;->a:Ll/zd4;

    iget-object p0, p0, Ll/yd4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    invoke-static {v0, p0, p1}, Ll/zd4;->q(Ll/zd4;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Landroid/view/View;)V

    return-void
.end method
