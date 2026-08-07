.class public final synthetic Ll/ycs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ycs;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    iput-object p2, p0, Ll/ycs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ycs;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    iget-object p0, p0, Ll/ycs;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->l(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;Landroid/view/View;)V

    return-void
.end method
