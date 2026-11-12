.class public final Ltf7;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Lorm;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorm;Lcom/opera/android/settings/SettingsManager;Lydn;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ltf7;->b:B

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    sget-object v0, Lvb0;->d:Lvb0;

    iput-object v0, p0, Ltf7;->f:Ljava/lang/Object;

    iput-object p1, p0, Ltf7;->c:Lorm;

    iput-object p2, p0, Ltf7;->d:Ljava/lang/Object;

    iput-object p3, p0, Ltf7;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5f;Ln32;Lgl6;Lbl6;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Ltf7;->b:B

    const/4 v0, 0x1

    .line 17
    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    .line 18
    iput-object p1, p0, Ltf7;->c:Lorm;

    .line 19
    iput-object p2, p0, Ltf7;->d:Ljava/lang/Object;

    .line 20
    iput-object p3, p0, Ltf7;->e:Ljava/lang/Object;

    .line 21
    iput-object p4, p0, Ltf7;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 4

    iget-byte v0, p0, Ltf7;->b:B

    packed-switch v0, :pswitch_data_3e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const v1, 0x7f1407cf

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ltf7;->e:Ljava/lang/Object;

    check-cast p0, Lydn;

    iget-object p0, p0, Lydn;->d:Lvdn;

    iget-boolean p0, p0, Lvdn;->a:Z

    if-eqz p0, :cond_2d

    const-string p0, "\n\n"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const p0, 0x7f14053b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lphj;->y(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object p0

    return-object p0

    :pswitch_36
    const p0, 0x7f140690

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Ltf7;->b:B

    const v0, 0x7f140b4b

    packed-switch p0, :pswitch_data_12

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-byte p0, p0, Ltf7;->b:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f140086

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f140693

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final getTheme()I
    .registers 2

    iget-byte v0, p0, Ltf7;->b:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lnz0;->getTheme()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f150295

    return p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-byte p0, p0, Ltf7;->b:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f1407d0

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f140694

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-byte p0, p0, Ltf7;->b:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f08053e

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f0803a1

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final k(Landroid/content/Context;)I
    .registers 3

    iget-byte v0, p0, Ltf7;->b:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Lb23;->k(Landroid/content/Context;)I

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x0

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final l(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    iget-byte p0, p0, Ltf7;->b:B

    packed-switch p0, :pswitch_data_12

    const p0, 0x7f040217

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_10
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final m(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    iget-byte v0, p0, Ltf7;->b:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Lb23;->m(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :pswitch_a
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final n()Landroid/widget/ImageView$ScaleType;
    .registers 2

    iget-byte v0, p0, Ltf7;->b:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lb23;->n()Landroid/widget/ImageView$ScaleType;

    move-result-object p0

    return-object p0

    :pswitch_a
    sget-object p0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 8

    iget-byte p1, p0, Ltf7;->b:B

    iget-object v0, p0, Ltf7;->c:Lorm;

    packed-switch p1, :pswitch_data_66

    iget-object p0, p0, Ltf7;->f:Ljava/lang/Object;

    check-cast p0, Lvb0;

    check-cast v0, Lx5f;

    iget-boolean p1, v0, Lx5f;->h:Z

    if-eqz p1, :cond_51

    iget-object p1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-virtual {p2, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    invoke-virtual {v1, p1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p1

    new-instance v1, Lpe0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p0, 0x1b

    invoke-virtual {p1, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_42

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_42

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4b

    :cond_42
    invoke-static {p1, p0, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4b
    invoke-virtual {v3, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, p2}, Lx5f;->U0(Lx56;)V

    :cond_51
    return-void

    :pswitch_52
    sget-object p1, Lhjm;->b:Lhjm;

    if-ne p2, p1, :cond_64

    check-cast v0, Lx5f;

    sget-object p1, Lvb0;->d:Lvb0;

    invoke-virtual {v0, p1}, Lx5f;->Q(Lvb0;)V

    iget-object p0, p0, Ltf7;->d:Ljava/lang/Object;

    check-cast p0, Ln32;

    invoke-virtual {p0}, Ln32;->run()V

    :cond_64
    return-void

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_52
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-byte p1, p0, Ltf7;->b:B

    sget-object v0, Lvb0;->c:Lvb0;

    packed-switch p1, :pswitch_data_1a

    iput-object v0, p0, Ltf7;->f:Ljava/lang/Object;

    return-void

    :pswitch_a
    iget-object p1, p0, Ltf7;->c:Lorm;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v0}, Lx5f;->Q(Lvb0;)V

    iget-object p0, p0, Ltf7;->d:Ljava/lang/Object;

    check-cast p0, Ln32;

    invoke-virtual {p0}, Ln32;->run()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    iget-byte p1, p0, Ltf7;->b:B

    sget-object v0, Lvb0;->b:Lvb0;

    packed-switch p1, :pswitch_data_24

    iget-object p1, p0, Ltf7;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    const/4 v1, 0x1

    const-string v2, "compression"

    invoke-virtual {p1, v1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iput-object v0, p0, Ltf7;->f:Ljava/lang/Object;

    return-void

    :pswitch_14
    iget-object p1, p0, Ltf7;->c:Lorm;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v0}, Lx5f;->Q(Lvb0;)V

    iget-object p0, p0, Ltf7;->e:Ljava/lang/Object;

    check-cast p0, Lgl6;

    invoke-virtual {p0}, Lgl6;->run()V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Ltf7;->b:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Lb23;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Lb23;->onShowDialog(Lbz0;)V

    iget-object p0, p0, Ltf7;->f:Ljava/lang/Object;

    check-cast p0, Lbl6;

    invoke-virtual {p0}, Lbl6;->run()V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
