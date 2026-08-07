.class public Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lv/VFrame;

.field public e:Lv/AutoVDraweeView;

.field public f:Lv/VFrame;

.field public g:Lv/VImage;

.field public h:Lv/VLinear;

.field public i:Lv/VText_NoTopPadding;

.field public j:Lv/VText_NoTopPadding;

.field public k:Lv/VText_NoTopPadding;

.field public l:Lv/VText_NoTopPadding;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rdp;->a(Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->g:Lv/VImage;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget v0, Ll/dbc0;->m9:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v0, Ll/dbc0;->l9:I

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->e:Lv/AutoVDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setOnSendClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->k:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setOnSkipClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->l:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSendButtonText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->k:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSkipButtonText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->l:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSubtitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->j:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialogView;->i:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
