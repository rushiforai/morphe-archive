.class public final Los1;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lfl3;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Los1;->a:B

    .line 15
    iput-object p1, p0, Los1;->d:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    .line 17
    iput-object p0, p1, Lfl3;->z:Los1;

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;B)V
    .registers 6

    .line 18
    iput-byte p4, p0, Los1;->a:B

    const/4 p4, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p4, v0}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Los1;->b:Ljava/lang/Object;

    iput-object p2, p0, Los1;->c:Ljava/lang/Object;

    iput-object p3, p0, Los1;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lo8f;Lpjg;Lpjg;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Los1;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Los1;->b:Ljava/lang/Object;

    iput-object p2, p0, Los1;->c:Ljava/lang/Object;

    iput-object p3, p0, Los1;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Los1;->a:B

    const v0, 0x7f1403bf

    packed-switch p0, :pswitch_data_1c

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_12
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_17
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_17
        :pswitch_12
        :pswitch_d
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Los1;->a:B

    const v0, 0x7f140ebc

    packed-switch p0, :pswitch_data_22

    const p0, 0x7f1407ae

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1a
    const p0, 0x7f1401ac

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_15
        :pswitch_10
    .end packed-switch
.end method

.method public final getTheme()I
    .registers 2

    iget-byte v0, p0, Los1;->a:B

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
        :pswitch_a
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 7

    iget-byte v0, p0, Los1;->a:B

    const v1, 0x7f1401b7

    packed-switch v0, :pswitch_data_e4

    iget-object v0, p0, Los1;->d:Ljava/lang/Object;

    check-cast v0, Lfl3;

    iget-object v0, v0, Lfl3;->s:Ljl3;

    iput-object v0, p0, Los1;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lov0;->j(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lov0;

    move-result-object v0

    iput-object v0, p0, Los1;->c:Ljava/lang/Object;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const v1, 0x7f1403a0

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Los1;->c:Ljava/lang/Object;

    check-cast v0, Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Los1;->c:Ljava/lang/Object;

    check-cast v2, Lov0;

    iget-object v2, v2, Lov0;->d:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v3, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    iget-object v3, p0, Los1;->c:Ljava/lang/Object;

    check-cast v3, Lov0;

    iget-object v3, v3, Lov0;->d:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Los1;->c:Ljava/lang/Object;

    check-cast v4, Lov0;

    iget-object v4, v4, Lov0;->d:Ljava/lang/Object;

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    const v0, 0x7f1407af

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    iget-object p0, p0, Los1;->c:Ljava/lang/Object;

    check-cast p0, Lov0;

    iget-object p0, p0, Lov0;->b:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1, p0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :pswitch_7c
    const v0, 0x7f14076f

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lphj;->J(Landroid/content/Context;)Lcom/opera/android/custom_views/StylingTextView;

    move-result-object v1

    const v2, 0x7f14076e

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lvk2;

    const/16 v3, 0xb

    invoke-direct {v2, p0, v3}, Lvk2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v0, v2}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    invoke-virtual {p1, v1}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :pswitch_9f
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f1401b1

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const v0, 0x7f1401b2

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    return-void

    :pswitch_c1
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f1401a4

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const v0, 0x7f1401a5

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    return-void

    nop

    :pswitch_data_e4
    .packed-switch 0x0
        :pswitch_c1
        :pswitch_9f
        :pswitch_7c
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 5

    iget-byte p1, p0, Los1;->a:B

    sget-object v0, Lhjm;->b:Lhjm;

    iget-object v1, p0, Los1;->d:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_28

    check-cast v1, Lfl3;

    const/4 p0, 0x0

    iput-object p0, v1, Lfl3;->z:Los1;

    return-void

    :pswitch_f
    iget-object p0, p0, Los1;->b:Ljava/lang/Object;

    check-cast p0, Lo8f;

    invoke-virtual {p0, p2}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_17
    if-ne p2, v0, :cond_1e

    check-cast v1, Lys1;

    invoke-virtual {v1}, Lys1;->invoke()Ljava/lang/Object;

    :cond_1e
    return-void

    :pswitch_1f
    if-ne p2, v0, :cond_26

    check-cast v1, Lys1;

    invoke-virtual {v1}, Lys1;->invoke()Ljava/lang/Object;

    :cond_26
    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 4

    iget-byte v0, p0, Los1;->a:B

    iget-object v1, p0, Los1;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_b
    check-cast v1, Lpjg;

    invoke-virtual {v1}, Lpjg;->run()V

    return-void

    :pswitch_11
    iget-object p0, p0, Los1;->c:Ljava/lang/Object;

    check-cast p0, Lys1;

    invoke-virtual {p0}, Lys1;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_19
    check-cast v1, Lys1;

    invoke-virtual {v1}, Lys1;->invoke()Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_19
        :pswitch_11
        :pswitch_b
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 11

    iget-byte p1, p0, Los1;->a:B

    packed-switch p1, :pswitch_data_90

    iget-object p1, p0, Los1;->c:Ljava/lang/Object;

    check-cast p1, Lov0;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    if-eqz p1, :cond_77

    iget-object v0, p0, Los1;->d:Ljava/lang/Object;

    check-cast v0, Lfl3;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    iget-object p0, p0, Los1;->b:Ljava/lang/Object;

    check-cast p0, Ljl3;

    iget-object p1, p0, Lll3;->a:Lal3;

    check-cast p1, Lml3;

    iget-object v7, v0, Lfl3;->C:Li53;

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v1

    move-object v3, v7

    check-cast v3, Lcom/opera/android/bookmarks/h;

    const/4 v8, 0x1

    invoke-virtual {v3, v1, v2, v8}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v1

    if-nez v1, :cond_3f

    iget-object p0, p0, Ljl3;->d:Lqm3;

    invoke-virtual {p0, v7}, Lqm3;->b(Li53;)Lml3;

    move-result-object p1

    :cond_3f
    new-instance v1, Lkkj;

    const/4 v6, 0x0

    const/4 v5, 0x0

    const-wide/16 v2, -0x1

    invoke-direct/range {v1 .. v6}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1, p1}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    move-result-object p0

    check-cast p0, Lml3;

    if-eqz p0, :cond_59

    new-instance p1, Ljl3;

    invoke-direct {p1, p0, v7, v8}, Ljl3;-><init>(Lml3;Li53;Z)V

    goto :goto_5a

    :cond_59
    const/4 p1, 0x0

    :goto_5a
    if-eqz p1, :cond_62

    iput-object p1, v0, Lfl3;->s:Ljl3;

    invoke-virtual {v0}, Lfl3;->J0()V

    goto :goto_77

    :cond_62
    iget-object p0, v0, Lfl3;->v:Landroid/content/Context;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f1407b0

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_77
    :goto_77
    return-void

    :pswitch_78
    iget-object p0, p0, Los1;->c:Ljava/lang/Object;

    check-cast p0, Lpjg;

    invoke-virtual {p0}, Lpjg;->run()V

    return-void

    :pswitch_80
    iget-object p0, p0, Los1;->b:Ljava/lang/Object;

    check-cast p0, Lx2;

    invoke-virtual {p0}, Lx2;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_88
    iget-object p0, p0, Los1;->c:Ljava/lang/Object;

    check-cast p0, Li51;

    invoke-virtual {p0}, Li51;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_88
        :pswitch_80
        :pswitch_78
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 7

    iget-byte v0, p0, Los1;->a:B

    packed-switch v0, :pswitch_data_72

    :pswitch_5
    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Los1;->d:Ljava/lang/Object;

    check-cast v0, Lfl3;

    iget-object v1, p0, Los1;->c:Ljava/lang/Object;

    check-cast v1, Lov0;

    iget-object v1, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, v1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    if-eqz v1, :cond_5d

    new-instance v2, Lvp2;

    const/4 v3, 0x3

    invoke-direct {v2, p0, p1, v3}, Lvp2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f1407b1

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    :goto_2e
    iget-object v2, v0, Lfl3;->u:Lel3;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3, p0}, Lel3;->G(Landroid/content/res/Resources;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4f

    add-int/lit8 p0, p1, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v2, 0x7f1407b2

    invoke-virtual {v0, v2, p1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    move-object v4, p1

    move p1, p0

    move-object p0, v4

    goto :goto_2e

    :cond_4f
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    const/4 p1, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v1, p1, p0}, Landroid/widget/EditText;->setSelection(II)V

    :cond_5d
    return-void

    :pswitch_5e
    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    const/4 p0, -0x1

    invoke-virtual {p1, p0}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void

    :pswitch_6a
    iget-object p0, p0, Los1;->b:Ljava/lang/Object;

    check-cast p0, Lys1;

    invoke-virtual {p0}, Lys1;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_5e
        :pswitch_5
        :pswitch_9
    .end packed-switch
.end method
