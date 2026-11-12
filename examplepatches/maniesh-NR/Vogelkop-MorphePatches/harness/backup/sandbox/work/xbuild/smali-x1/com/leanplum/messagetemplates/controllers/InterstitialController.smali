.class public Lcom/leanplum/messagetemplates/controllers/InterstitialController;
.super Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/InterstitialOptions;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;-><init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/BaseMessageOptions;)V

    return-void
.end method


# virtual methods
.method public applyWindowDecoration()V
    .registers 3

    invoke-static {}, Lcom/leanplum/messagetemplates/MessageTemplates;->getCustomizer()Lcom/leanplum/messagetemplates/DialogCustomizer;

    move-result-object v0

    if-eqz v0, :cond_b

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-interface {v0, p0, v1}, Lcom/leanplum/messagetemplates/DialogCustomizer;->customizeInterstitial(Landroid/app/Dialog;Landroid/view/View;)V

    :cond_b
    return-void
.end method

.method public bridge synthetic cancel()V
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->cancel()V

    return-void
.end method

.method public createLayoutParams()Landroid/widget/RelativeLayout$LayoutParams;
    .registers 2

    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p0, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public bridge synthetic getContentView()Landroid/view/View;
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->getContentView()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getOptions()Lcom/leanplum/messagetemplates/options/BaseMessageOptions;
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->getOptions()Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    move-result-object p0

    return-object p0
.end method

.method public isFullscreen()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic onBackPressed()V
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->onBackPressed()V

    return-void
.end method
