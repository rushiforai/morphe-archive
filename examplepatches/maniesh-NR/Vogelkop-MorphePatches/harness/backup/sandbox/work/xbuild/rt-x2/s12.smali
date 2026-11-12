.class public final Ls12;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lg77;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ls12;->a:B

    const/4 v1, 0x0

    .line 14
    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    .line 15
    iput-object p2, p0, Ls12;->c:Ljava/lang/Object;

    .line 16
    iput-object p1, p0, Ls12;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(ZLpxh;Lkotlin/jvm/functions/Function0;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Ls12;->a:B

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-boolean p1, p0, Ls12;->b:Z

    iput-object p2, p0, Ls12;->c:Ljava/lang/Object;

    iput-object p3, p0, Ls12;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Ls12;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Lnz0;->getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    const p0, 0x7f140b48

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Ls12;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Lnz0;->getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    const p0, 0x7f140bec

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 10

    iget-byte v0, p0, Ls12;->a:B

    iget-object v1, p0, Ls12;->c:Ljava/lang/Object;

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_132

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v1, Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v4, 0x7f140be7

    invoke-virtual {v2, v4, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f140be6

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Laz0;->a:Lwy0;

    iput-object v1, v2, Lwy0;->f:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v1, Luk6;

    const/16 v2, 0xf

    invoke-direct {v1, p0, v2}, Luk6;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f140e97

    invoke-static {p1, p0, v3, v1}, Lphj;->I(Landroid/content/Context;IZLav4;)Landroid/widget/FrameLayout;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void

    :pswitch_51
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v4, 0x0

    const v5, 0x7f0d0064

    invoke-virtual {v0, v5, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v4, 0x7f0a02df

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/core/widget/NestedScrollView;

    if-eqz v5, :cond_120

    const v4, 0x7f0a02e0

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v5, :cond_120

    const v4, 0x7f0a051c

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_120

    const v4, 0x7f0a07c6

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_120

    check-cast v0, Landroid/widget/LinearLayout;

    check-cast v1, Lpxh;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v1, v4}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Lqb7;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    new-instance v5, Lpa;

    const/16 v7, 0x19

    invoke-direct {v5, p0, v7}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v6, v4, v5}, Lqb7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v4, p0, Ls12;->d:Ljava/lang/Object;

    check-cast v4, Lkotlin/jvm/functions/Function0;

    invoke-interface {v4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lr12;

    iget-boolean p0, p0, Ls12;->b:Z

    if-eqz p0, :cond_c4

    const p0, 0x7f080244

    goto :goto_c7

    :cond_c4
    const p0, 0x7f0804df

    :goto_c7
    new-instance v5, Lq12;

    invoke-direct {v5, v4, v3}, Lq12;-><init>(Lr12;B)V

    const v3, 0x7f1404fa

    invoke-virtual {v1, p0, v3, v5}, Lqb7;->b(IILandroid/view/View$OnClickListener;)V

    new-instance p0, Lq12;

    invoke-direct {p0, v4, v2}, Lq12;-><init>(Lr12;B)V

    const v2, 0x7f080631

    const v3, 0x7f140f42

    invoke-virtual {v1, v2, v3, p0}, Lqb7;->b(IILandroid/view/View$OnClickListener;)V

    new-instance p0, Lq12;

    const/4 v2, 0x2

    invoke-direct {p0, v4, v2}, Lq12;-><init>(Lr12;B)V

    const v2, 0x7f080551

    const v3, 0x7f1400e8

    invoke-virtual {v1, v2, v3, p0}, Lqb7;->b(IILandroid/view/View$OnClickListener;)V

    new-instance p0, Lq12;

    const/4 v2, 0x3

    invoke-direct {p0, v4, v2}, Lq12;-><init>(Lr12;B)V

    const v2, 0x7f080543

    const v3, 0x7f140503

    invoke-virtual {v1, v2, v3, p0}, Lqb7;->b(IILandroid/view/View$OnClickListener;)V

    new-instance p0, Lq12;

    const/4 v2, 0x4

    invoke-direct {p0, v4, v2}, Lq12;-><init>(Lr12;B)V

    const v2, 0x7f0805f4

    const v3, 0x7f140509

    invoke-virtual {v1, v2, v3, p0}, Lqb7;->b(IILandroid/view/View$OnClickListener;)V

    new-instance p0, Lq12;

    const/4 v2, 0x5

    invoke-direct {p0, v4, v2}, Lq12;-><init>(Lr12;B)V

    const v2, 0x7f080533

    const v3, 0x7f1404f2

    invoke-virtual {v1, v2, v3, p0}, Lqb7;->b(IILandroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    goto :goto_131

    :cond_120
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_131
    return-void

    :pswitch_data_132
    .packed-switch 0x0
        :pswitch_51
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    iget-byte v0, p0, Ls12;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    return-void

    :pswitch_9
    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_16

    iget-object p0, p0, Ls12;->d:Ljava/lang/Object;

    check-cast p0, Lg77;

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1}, Lg77;->y(ZZZ)V

    :cond_16
    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Ls12;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Ls12;->d:Ljava/lang/Object;

    check-cast p1, Lg77;

    const/4 v0, 0x0

    iget-boolean p0, p0, Ls12;->b:Z

    invoke-virtual {p1, v0, p0, v0}, Lg77;->y(ZZZ)V

    return-void

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 4

    iget-byte p1, p0, Ls12;->a:B

    packed-switch p1, :pswitch_data_12

    return-void

    :pswitch_6
    iget-object p1, p0, Ls12;->d:Ljava/lang/Object;

    check-cast p1, Lg77;

    iget-boolean p0, p0, Ls12;->b:Z

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, v1, p0, v0}, Lg77;->y(ZZZ)V

    return-void

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
