.class abstract Lcom/leanplum/messagetemplates/controllers/BaseController;
.super Landroid/app/Dialog;
.source "SourceFile"


# instance fields
.field protected activity:Landroid/app/Activity;

.field protected contentView:Landroid/widget/RelativeLayout;

.field protected isClosing:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3

    invoke-static {p1}, Lcom/leanplum/views/ViewUtils;->getThemeId(Landroid/app/Activity;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->isClosing:Z

    iput-object p1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/messagetemplates/controllers/BaseController;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/controllers/BaseController;->lambda$createCloseButton$0(Landroid/view/View;)V

    return-void
.end method

.method private createCloseButton(Landroid/view/View;)Lcom/leanplum/views/CloseButton;
    .registers 7

    new-instance v0, Lcom/leanplum/views/CloseButton;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/leanplum/views/CloseButton;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/leanplum/core/R$id;->close_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->isFullscreen()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_29

    const/16 p1, 0xa

    invoke-virtual {v1, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 p1, 0xb

    invoke-virtual {v1, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    sget p1, Lcom/leanplum/utils/SizeUtil;->dp5:I

    invoke-virtual {v1, v3, p1, p1, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    goto :goto_3f

    :cond_29
    const/4 v2, 0x6

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    invoke-virtual {v1, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/4 v2, 0x7

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-virtual {v1, v2, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    sget p1, Lcom/leanplum/utils/SizeUtil;->dp7:I

    neg-int p1, p1

    invoke-virtual {v1, v3, p1, p1, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :goto_3f
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lcom/leanplum/messagetemplates/controllers/a;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v1}, Lcom/leanplum/messagetemplates/controllers/a;-><init>(Lcom/leanplum/messagetemplates/controllers/BaseController;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private createContentView()Landroid/widget/RelativeLayout;
    .registers 3

    new-instance v0, Landroid/widget/RelativeLayout;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {v0, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private createMessageView()Landroid/widget/RelativeLayout;
    .registers 4

    new-instance v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/leanplum/core/R$id;->container_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->createLayoutParams()Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->isFullscreen()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Lcom/leanplum/views/ViewUtils;->applyBackground(Landroid/view/View;IZ)V

    invoke-virtual {p0, v0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->addMessageChildViews(Landroid/widget/RelativeLayout;)V

    return-object v0
.end method

.method private synthetic lambda$createCloseButton$0(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->runDismissAction()V

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->cancel()V

    return-void
.end method


# virtual methods
.method public abstract addMessageChildViews(Landroid/widget/RelativeLayout;)V
.end method

.method public abstract applyWindowDecoration()V
.end method

.method public cancel()V
    .registers 3

    iget-boolean v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->isClosing:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->isClosing:Z

    const-wide/16 v0, 0x15e

    invoke-static {v0, v1}, Lcom/leanplum/views/ViewUtils;->createFadeOutAnimation(J)Landroid/view/animation/Animation;

    move-result-object v0

    new-instance v1, Lcom/leanplum/messagetemplates/controllers/BaseController$1;

    invoke-direct {v1, p0}, Lcom/leanplum/messagetemplates/controllers/BaseController$1;-><init>(Lcom/leanplum/messagetemplates/controllers/BaseController;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public abstract createLayoutParams()Landroid/widget/RelativeLayout$LayoutParams;
.end method

.method public getContentView()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    return-object p0
.end method

.method public abstract hasDismissButton()Z
.end method

.method public init()V
    .registers 3

    invoke-direct {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->createContentView()Landroid/widget/RelativeLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-direct {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->createMessageView()Landroid/widget/RelativeLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->hasDismissButton()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->createCloseButton(Landroid/view/View;)Lcom/leanplum/views/CloseButton;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_1e
    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->applyWindowDecoration()V

    iget-object v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    const-wide/16 v0, 0x15e

    invoke-static {v0, v1}, Lcom/leanplum/views/ViewUtils;->createFadeInAnimation(J)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public abstract isFullscreen()Z
.end method

.method public onBackPressed()V
    .registers 1

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->runDismissAction()V

    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    return-void
.end method

.method public onFadeOutAnimationEnd()V
    .registers 1

    invoke-super {p0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method public abstract runDismissAction()V
.end method
