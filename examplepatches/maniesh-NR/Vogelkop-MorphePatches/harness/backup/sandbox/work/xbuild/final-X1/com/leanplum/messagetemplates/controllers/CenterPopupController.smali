.class public Lcom/leanplum/messagetemplates/controllers/CenterPopupController;
.super Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/CenterPopupOptions;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;-><init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/BaseMessageOptions;)V

    return-void
.end method


# virtual methods
.method public applyWindowDecoration()V
    .registers 3

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1b

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const v1, 0x3f333333    # 0.7f

    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    invoke-static {}, Lcom/leanplum/messagetemplates/MessageTemplates;->getCustomizer()Lcom/leanplum/messagetemplates/DialogCustomizer;

    move-result-object v0

    if-eqz v0, :cond_1b

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-interface {v0, p0, v1}, Lcom/leanplum/messagetemplates/DialogCustomizer;->customizeCenterPopup(Landroid/app/Dialog;Landroid/view/View;)V

    :cond_1b
    return-void
.end method

.method public bridge synthetic cancel()V
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->cancel()V

    return-void
.end method

.method public createLayoutParams()Landroid/widget/RelativeLayout$LayoutParams;
    .registers 8

    iget-object v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/leanplum/utils/SizeUtil;->getDisplaySize(Landroid/app/Activity;)Landroid/graphics/Point;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    check-cast v2, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;

    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->getWidth()I

    move-result v2

    invoke-static {v1, v2}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v1

    iget-object v2, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    check-cast p0, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->getHeight()I

    move-result p0

    invoke-static {v2, p0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    iget v2, v0, Landroid/graphics/Point;->x:I

    sget v3, Lcom/leanplum/utils/SizeUtil;->dp20:I

    sub-int/2addr v2, v3

    iget v0, v0, Landroid/graphics/Point;->y:I

    sub-int/2addr v0, v3

    int-to-double v3, v1

    int-to-double v5, p0

    div-double v5, v3, v5

    if-le v1, v2, :cond_38

    div-double/2addr v3, v5

    double-to-int v3, v3

    if-ge v3, v0, :cond_38

    int-to-double v3, v2

    div-double/2addr v3, v5

    double-to-int p0, v3

    move v1, v2

    :cond_38
    if-le p0, v0, :cond_43

    int-to-double v3, p0

    mul-double/2addr v3, v5

    double-to-int v3, v3

    if-ge v3, v2, :cond_43

    int-to-double v1, v0

    mul-double/2addr v1, v5

    double-to-int v1, v1

    goto :goto_44

    :cond_43
    move v0, p0

    :goto_44
    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p0, v1, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v0, 0xd

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

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

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic onBackPressed()V
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->onBackPressed()V

    return-void
.end method
