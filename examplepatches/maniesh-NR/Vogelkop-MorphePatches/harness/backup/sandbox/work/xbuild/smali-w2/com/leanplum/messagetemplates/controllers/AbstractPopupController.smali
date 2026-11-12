.class abstract Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;
.super Lcom/leanplum/messagetemplates/controllers/BaseController;
.source "SourceFile"


# instance fields
.field protected options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/BaseMessageOptions;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/controllers/BaseController;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->init()V

    return-void
.end method

.method public static synthetic b(Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->lambda$createAcceptButton$0(Landroid/view/View;)V

    return-void
.end method

.method private createAcceptButton(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 5

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget p1, Lcom/leanplum/core/R$id;->accept_button:I

    invoke-virtual {v0, p1}, Landroid/view/View;->setId(I)V

    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p1, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xc

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xe

    invoke-virtual {p1, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/4 v1, 0x0

    sget v2, Lcom/leanplum/utils/SizeUtil;->dp5:I

    invoke-virtual {p1, v1, v1, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    sget v1, Lcom/leanplum/utils/SizeUtil;->dp20:I

    sget v2, Lcom/leanplum/utils/SizeUtil;->dp5:I

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getAcceptButtonText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getAcceptButtonTextColor()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p1, 0x0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getAcceptButtonBackgroundColor()I

    move-result p1

    const/16 v1, 0x1e

    invoke-static {v0, p1, v1}, Lcom/leanplum/utils/BitmapUtil;->stateBackgroundDarkerByPercentage(Landroid/view/View;II)V

    const/4 p1, 0x2

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, p1, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    new-instance p1, Lcom/leanplum/messagetemplates/controllers/a;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v1}, Lcom/leanplum/messagetemplates/controllers/a;-><init>(Lcom/leanplum/messagetemplates/controllers/BaseController;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private createBackgroundImageView(Landroid/content/Context;)Landroid/widget/ImageView;
    .registers 5

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->isFullscreen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    new-instance v1, Lcom/leanplum/views/BackgroundImageView;

    iget-object v2, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getBackgroundColor()I

    move-result v2

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getBackgroundImage()Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-direct {v1, p1, v2, p0, v0}, Lcom/leanplum/views/BackgroundImageView;-><init>(Landroid/content/Context;ILandroid/graphics/Bitmap;Z)V

    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 p1, -0x1

    invoke-direct {p0, p1, p1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v1
.end method

.method private createMessageView(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 4

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p1, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getMessageText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getMessageColor()I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p0, 0x2

    const/high16 p1, 0x41900000    # 18.0f

    invoke-virtual {v0, p0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    return-object v0
.end method

.method private createTitleView(Landroid/content/Context;)Landroid/widget/RelativeLayout;
    .registers 7

    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/leanplum/core/R$id;->title_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    sget v4, Lcom/leanplum/utils/SizeUtil;->dp5:I

    invoke-virtual {v1, p1, v4, p1, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 p1, 0x11

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->getTitleColor()I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p0, 0x2

    const/high16 p1, 0x41a00000    # 20.0f

    invoke-virtual {v1, p0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    const/4 p0, 0x0

    const/4 p1, 0x1

    invoke-virtual {v1, p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 p1, 0xe

    invoke-virtual {p0, p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 p1, 0xf

    invoke-virtual {p0, p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private synthetic lambda$createAcceptButton$0(Landroid/view/View;)V
    .registers 2

    iget-boolean p1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->isClosing:Z

    if-nez p1, :cond_c

    iget-object p1, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->accept()V

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->cancel()V

    :cond_c
    return-void
.end method


# virtual methods
.method public addMessageChildViews(Landroid/widget/RelativeLayout;)V
    .registers 6

    iget-object v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->createBackgroundImageView(Landroid/content/Context;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->createTitleView(Landroid/content/Context;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {p0, v1}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->createAcceptButton(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {p0, v2}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->createMessageView(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, 0x3

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {v2, v3, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, 0x2

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method public getOptions()Lcom/leanplum/messagetemplates/options/BaseMessageOptions;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    return-object p0
.end method

.method public hasDismissButton()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public runDismissAction()V
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->options:Lcom/leanplum/messagetemplates/options/BaseMessageOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->dismiss()V

    return-void
.end method
