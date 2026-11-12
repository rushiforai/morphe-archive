.class public Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;
.super Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/widget/TextView;Ljava/lang/String;Landroid/content/res/ColorStateList;)V
    .registers 6

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eqz p2, :cond_19

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez p3, :cond_12

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p3

    :cond_12
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1c

    :cond_19
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_1c
    iget-object p1, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->e:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2d

    iget-object p1, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->f:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2d

    move v0, v1

    :cond_2d
    iget-object p0, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->g:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a06c5

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->d:Landroid/widget/TextView;

    const v0, 0x7f0a0324

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->e:Landroid/widget/TextView;

    const v0, 0x7f0a0594

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->f:Landroid/widget/TextView;

    const v0, 0x7f0a01a7

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/downloads/SaveSheet$OptionTextAreaLayout;->g:Landroid/view/View;

    return-void
.end method
