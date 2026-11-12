.class public final Lg25;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:I

.field public final c:I

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(IILjava/lang/String;Ljl4;Ld35;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lg25;->a:B

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput p1, p0, Lg25;->b:I

    iput p2, p0, Lg25;->c:I

    iput-object p3, p0, Lg25;->f:Ljava/lang/Object;

    iput-object p4, p0, Lg25;->d:Ljava/lang/Object;

    iput-object p5, p0, Lg25;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILpxh;ILandroid/content/DialogInterface$OnClickListener;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lg25;->a:B

    .line 18
    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    .line 19
    iput-object p1, p0, Lg25;->d:Ljava/lang/Object;

    .line 20
    iput p2, p0, Lg25;->b:I

    .line 21
    iput-object p3, p0, Lg25;->e:Ljava/lang/Object;

    .line 22
    iput p4, p0, Lg25;->c:I

    .line 23
    iput-object p5, p0, Lg25;->f:Ljava/lang/Object;

    return-void
.end method

.method public static b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;
    .registers 11

    new-instance v3, Lrxh;

    invoke-direct {v3, p2}, Lrxh;-><init>(I)V

    new-instance v0, Lg25;

    const/4 v1, 0x0

    move v2, p1

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lg25;-><init>(Landroid/content/Context;ILpxh;ILandroid/content/DialogInterface$OnClickListener;)V

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-object v0
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-byte p0, p0, Lg25;->a:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f140fa1

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final getNeutralButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lg25;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Lnz0;->getNeutralButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    const p0, 0x7f140fa6

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

    iget-byte v0, p0, Lg25;->a:B

    packed-switch v0, :pswitch_data_14

    const p0, 0x7f140fa0

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    iget p0, p0, Lg25;->c:I

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 7

    iget-byte v0, p0, Lg25;->a:B

    iget v1, p0, Lg25;->b:I

    packed-switch v0, :pswitch_data_70

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0d010a

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v2, 0x7f0a0297

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_44

    const v2, 0x7f0a06c5

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v4, :cond_44

    check-cast v0, Landroid/widget/RelativeLayout;

    iget v2, p0, Lg25;->c:I

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, p0, Lg25;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p1, Laz0;->a:Lwy0;

    iput-object v0, p0, Lwy0;->e:Landroid/view/View;

    invoke-virtual {p1, v1}, Laz0;->a(I)V

    goto :goto_55

    :cond_44
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_55
    return-void

    :pswitch_56
    iget-object p0, p0, Lg25;->e:Ljava/lang/Object;

    check-cast p0, Lpxh;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    iget-object v0, p1, Laz0;->a:Lwy0;

    iput-object p0, v0, Lwy0;->f:Ljava/lang/CharSequence;

    if-eqz v1, :cond_6f

    invoke-virtual {p1, v1}, Laz0;->b(I)V

    :cond_6f
    return-void

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_56
    .end packed-switch
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lg25;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0, p1}, Lnz0;->onDialogCreated(Lbz0;)V

    return-void

    :pswitch_9
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-byte p1, p0, Lg25;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lg25;->e:Ljava/lang/Object;

    check-cast p0, Ld35;

    invoke-virtual {p0}, Ld35;->run()V

    return-void

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lg25;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lg25;->d:Ljava/lang/Object;

    check-cast p0, Ljl4;

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lc35;

    const/4 p1, 0x3

    iput p1, p0, Lc35;->d:I

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lg25;->a:B

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Lg25;->d:Ljava/lang/Object;

    check-cast p0, Ljl4;

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lc35;

    const/4 p1, 0x2

    iput p1, p0, Lc35;->d:I

    return-void

    :pswitch_11
    iget-object p0, p0, Lg25;->f:Ljava/lang/Object;

    check-cast p0, Landroid/content/DialogInterface$OnClickListener;

    const/4 v0, -0x1

    invoke-interface {p0, p1, v0}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

.method public final wrapContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 3

    iget-byte v0, p0, Lg25;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Lnz0;->wrapContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object v0, p0, Lg25;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    if-nez v0, :cond_14

    invoke-super {p0, p1}, Lnz0;->wrapContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    :cond_14
    return-object v0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
