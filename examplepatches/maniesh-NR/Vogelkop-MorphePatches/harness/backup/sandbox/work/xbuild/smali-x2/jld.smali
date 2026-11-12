.class public final Ljld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llig;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View$OnClickListener;B)V
    .registers 3

    iput-byte p2, p0, Ljld;->a:B

    iput-object p1, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final k(I)V
    .registers 2

    return-void
.end method

.method private final l(Z)V
    .registers 2

    return-void
.end method

.method private final m(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final b(J)V
    .registers 5

    iget-byte v0, p0, Ljld;->a:B

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->k:Lcom/google/android/material/slider/Slider;

    const-wide/16 v0, 0x1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    long-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/Slider;->D0(F)V

    return-void

    :pswitch_18
    check-cast p0, Lrld;

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->s:Landroidx/appcompat/widget/AppCompatSeekBar;

    long-to-int v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    iget-object p0, p0, Lrld;->p:Lnld;

    iget-object v0, p0, Lnld;->h:Lpld;

    iput-wide p1, v0, Lpld;->i:J

    iget-object p0, p0, Lnld;->j:Lpgh;

    iput-wide p1, p0, Lpgh;->f:J

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final c(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Ljld;->a:B

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    packed-switch v0, :pswitch_data_1c

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->p:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_11
    check-cast p0, Lrld;

    iget-object p0, p0, Lrld;->m:Lhld;

    iget-object p0, p0, Lhld;->f:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

.method public final d(ZZ)V
    .registers 10

    iget-byte v0, p0, Ljld;->a:B

    const/4 v1, 0x0

    const v2, 0x7f1412ae

    const v3, 0x7f1412ad

    const v4, 0x7f0805b9

    const v5, 0x7f0805b0

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    packed-switch v0, :pswitch_data_60

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->b:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_1d

    move v4, v5

    :cond_1d
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->b:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->b:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_2e

    move v2, v3

    :cond_2e
    invoke-static {p0, v2, v1}, Ln1h;->n(Landroid/view/View;II)V

    return-void

    :pswitch_32
    check-cast p0, Lrld;

    iget-object v0, p0, Lrld;->p:Lnld;

    iput-boolean p1, v0, Lnld;->m:Z

    iget-object v6, v0, Lnld;->j:Lpgh;

    iput-boolean p1, v6, Lpgh;->g:Z

    iget-boolean v6, v0, Lnld;->l:Z

    if-eqz v6, :cond_43

    invoke-virtual {v0}, Lnld;->c()V

    :cond_43
    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->m:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_4a

    move v4, v5

    :cond_4a
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->m:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lrld;->m:Lhld;

    iget-object p0, p0, Lhld;->m:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_5b

    move v2, v3

    :cond_5b
    invoke-static {p0, v2, v1}, Ln1h;->n(Landroid/view/View;II)V

    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method

.method public final e(J)V
    .registers 4

    iget-byte v0, p0, Ljld;->a:B

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->k:Lcom/google/android/material/slider/Slider;

    long-to-float p1, p1

    invoke-virtual {v0}, Lcom/google/android/material/slider/Slider;->w()F

    move-result p2

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->k:Lcom/google/android/material/slider/Slider;

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->x()F

    move-result p0

    invoke-static {p1, p2, p0}, Lcs5;->s(FFF)F

    move-result p0

    invoke-virtual {v0, p0}, Lcom/google/android/material/slider/Slider;->C0(F)V

    return-void

    :pswitch_22
    check-cast p0, Lrld;

    iget-object p0, p0, Lrld;->m:Lhld;

    iget-object p0, p0, Lhld;->s:Landroidx/appcompat/widget/AppCompatSeekBar;

    long-to-int p1, p1

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method

.method public final f(ZZ)V
    .registers 4

    iget-byte v0, p0, Ljld;->a:B

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->t:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->s:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0, p2}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_18
    check-cast p0, Lrld;

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->x:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lrld;->m:Lhld;

    iget-object p1, p1, Lhld;->w:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lrld;->p:Lnld;

    iget-object p0, p0, Lnld;->j:Lpgh;

    iput-boolean p2, p0, Lpgh;->h:Z

    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final g(Z)V
    .registers 4

    iget-byte v0, p0, Ljld;->a:B

    packed-switch v0, :pswitch_data_30

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->e:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setActivated(Z)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->f:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setActivated(Z)V

    if-eqz p1, :cond_1d

    const p1, 0x7f1412b6

    goto :goto_20

    :cond_1d
    const p1, 0x7f1412b5

    :goto_20
    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->e:Lcom/opera/android/custom_views/StylingImageButton;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Ln1h;->n(Landroid/view/View;II)V

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->f:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {p0, p1, v1}, Ln1h;->n(Landroid/view/View;II)V

    :pswitch_2f
    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method

.method public final h(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Ljld;->a:B

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    packed-switch v0, :pswitch_data_1c

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->o:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_11
    check-cast p0, Lrld;

    iget-object p0, p0, Lrld;->m:Lhld;

    iget-object p0, p0, Lhld;->k:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

.method public final i(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 4

    iget-byte v0, p0, Ljld;->a:B

    packed-switch v0, :pswitch_data_50

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->q:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_47

    iget-object p1, p0, Lcom/opera/android/media/PlayerControlView;->b:Lmig;

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    if-eqz v0, :cond_31

    iget-object p1, p1, Lmig;->d:Ltjg;

    iget-object p1, p1, Ltjg;->k:Lokg;

    iget-object p1, p1, Lokg;->e:Ljava/util/HashMap;

    iget-object v0, v0, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Legd;

    goto :goto_32

    :cond_31
    const/4 p1, 0x0

    :goto_32
    if-eqz p1, :cond_47

    invoke-virtual {p1}, Legd;->b()Lo29;

    move-result-object p1

    sget-object v0, Lo29;->b:Lo29;

    if-ne p1, v0, :cond_47

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f14131a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    :cond_47
    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->n:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :pswitch_4e
    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_4e
    .end packed-switch
.end method

.method public final j(ZZZ)V
    .registers 7

    iget-byte v0, p0, Ljld;->a:B

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    packed-switch v0, :pswitch_data_62

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p2, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p2, p2, Lwkd;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p2, p3}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->k:Lcom/google/android/material/slider/Slider;

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/Slider;->setEnabled(Z)V

    return-void

    :pswitch_1f
    check-cast p0, Lrld;

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->q:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->r:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p3}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->s:Landroidx/appcompat/widget/AppCompatSeekBar;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lrld;->p:Lnld;

    iget-object v0, p0, Lnld;->h:Lpld;

    iput-boolean p1, v0, Lpld;->f:Z

    const/4 v1, 0x0

    if-nez p1, :cond_54

    iput-boolean v1, v0, Lpld;->g:Z

    iget-boolean p1, v0, Lpld;->h:Z

    if-eqz p1, :cond_54

    iget-object p1, v0, Lpld;->c:Lbp;

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Lhld;

    iget-object p1, p1, Lhld;->t:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v1, v0, Lpld;->h:Z

    :cond_54
    iget-object p0, p0, Lnld;->j:Lpgh;

    iput-boolean p2, p0, Lpgh;->i:Z

    iput-boolean p3, p0, Lpgh;->j:Z

    if-nez p2, :cond_60

    if-nez p3, :cond_60

    iput v1, p0, Lpgh;->e:I

    :cond_60
    return-void

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method

.method public final setRepeatMode(I)V
    .registers 7

    iget-byte v0, p0, Ljld;->a:B

    packed-switch v0, :pswitch_data_56

    iget-object p0, p0, Ljld;->b:Landroid/view/View$OnClickListener;

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    const v0, 0x7f0805d9

    const v1, 0x7f0805d8

    const/4 v2, 0x0

    if-eqz p1, :cond_26

    const/4 v3, 0x1

    if-eq p1, v3, :cond_1c

    const/4 v4, 0x2

    if-ne p1, v4, :cond_54

    const p1, 0x7f1412b0

    goto :goto_2a

    :cond_1c
    const v1, 0x7f0805da

    const v0, 0x7f0805db

    const p1, 0x7f1412b2

    goto :goto_2a

    :cond_26
    const p1, 0x7f1412b1

    move v3, v2

    :goto_2a
    iget-object v4, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v4, v4, Lwkd;->c:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v4, v3}, Landroid/view/View;->setActivated(Z)V

    iget-object v4, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v4, v4, Lwkd;->c:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v4, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v1, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v1, v1, Lwkd;->c:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v1, p1, v2}, Ln1h;->n(Landroid/view/View;II)V

    iget-object v1, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v1, v1, Lwkd;->d:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v3}, Landroid/view/View;->setActivated(Z)V

    iget-object v1, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v1, v1, Lwkd;->d:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->d:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {p0, p1, v2}, Ln1h;->n(Landroid/view/View;II)V

    :cond_54
    :pswitch_54
    return-void

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_54
    .end packed-switch
.end method
