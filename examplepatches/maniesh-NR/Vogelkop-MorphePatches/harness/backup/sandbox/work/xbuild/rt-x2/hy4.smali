.class public final Lhy4;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Z

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcie;Li16;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lhy4;->a:B

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    .line 21
    iput-object p1, p0, Lhy4;->b:Ljava/lang/Object;

    .line 22
    iput-object p2, p0, Lhy4;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;Ljava/lang/String;[Liy4;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lhy4;->a:B

    .line 23
    iput-object p1, p0, Lhy4;->e:Ljava/lang/Object;

    .line 24
    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    .line 25
    iput-object p2, p0, Lhy4;->b:Ljava/lang/Object;

    .line 26
    iput-object p3, p0, Lhy4;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ldb;Lbf9;Luif;)V
    .registers 6

    const/4 v0, 0x3

    iput-byte v0, p0, Lhy4;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 16
    invoke-direct {p0, v1, v0}, Lnz0;-><init>(ZZ)V

    .line 17
    iput-object p1, p0, Lhy4;->b:Ljava/lang/Object;

    .line 18
    iput-object p2, p0, Lhy4;->d:Ljava/lang/Object;

    .line 19
    iput-object p3, p0, Lhy4;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lb27;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lhy4;->a:B

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lhy4;->b:Ljava/lang/Object;

    iput-object p2, p0, Lhy4;->d:Ljava/lang/Object;

    iput-object p3, p0, Lhy4;->e:Ljava/lang/Object;

    iput-boolean v0, p0, Lhy4;->c:Z

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lhy4;->a:B

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

    iget-byte v0, p0, Lhy4;->a:B

    iget-object p0, p0, Lhy4;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2a

    const p0, 0x7f14115a

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_f
    const p0, 0x7f140769

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_17
    check-cast p0, Ljava/lang/String;

    return-object p0

    :pswitch_1a
    check-cast p0, [Liy4;

    array-length p0, p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_28

    const p0, 0x7f141116

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_29

    :cond_28
    const/4 p0, 0x0

    :goto_29
    return-object p0

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final getTheme()I
    .registers 2

    iget-byte v0, p0, Lhy4;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lnz0;->getTheme()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f150295

    return p0

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 12

    iget-byte v0, p0, Lhy4;->a:B

    iget-object v1, p0, Lhy4;->d:Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lhy4;->b:Ljava/lang/Object;

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_c2

    const p0, 0x7f1411ff

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f1411fe

    invoke-static {p0, v0, v2, v4}, Lphj;->I(Landroid/content/Context;IZLav4;)Landroid/widget/FrameLayout;

    move-result-object p0

    invoke-virtual {p1, p0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :pswitch_20
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0d0143

    invoke-virtual {v0, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    new-instance v2, Li9c;

    check-cast v3, Lcie;

    check-cast v1, Li16;

    invoke-direct {v2, v0, v3, v1}, Li9c;-><init>(Landroid/view/ViewGroup;Lcie;Li16;)V

    iput-object v2, p0, Lhy4;->e:Ljava/lang/Object;

    sget-object p0, Lr5n;->a:Ljava/util/WeakHashMap;

    const p0, 0x7f0a0453

    invoke-static {v0, p0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    iget-object v1, v2, Li9c;->e:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :pswitch_55
    check-cast v3, Ljava/lang/String;

    iget-object p0, p1, Laz0;->a:Lwy0;

    iput-object v3, p0, Lwy0;->f:Ljava/lang/CharSequence;

    return-void

    :pswitch_5c
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f0d010c

    invoke-virtual {v5, v6, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getPaddingStart()I

    move-result v5

    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    invoke-virtual {v4}, Landroid/view/View;->getPaddingEnd()I

    move-result v7

    const/high16 v8, 0x41800000    # 16.0f

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-static {v8, v9}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/view/View;->setPaddingRelative(IIII)V

    const v5, 0x7f0a06c5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    const v6, 0x7f0a07c8

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object v4, p1, Lwy0;->e:Landroid/view/View;

    new-instance v3, Lyy0;

    check-cast v1, [Liy4;

    invoke-direct {v3, v0, v2, v1}, Lyy0;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    new-instance v0, Lsk;

    const/4 v2, 0x5

    invoke-direct {v0, p0, v2}, Lsk;-><init>(Ljava/lang/Object;B)V

    iput-object v3, p1, Lwy0;->o:Landroid/widget/ListAdapter;

    iput-object v0, p1, Lwy0;->p:Landroid/content/DialogInterface$OnClickListener;

    array-length p0, v1

    const/4 v0, 0x1

    if-ne p0, v0, :cond_b8

    const p0, 0x7f141117

    goto :goto_bb

    :cond_b8
    const p0, 0x7f14042c

    :goto_bb
    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setText(I)V

    iput-boolean v0, p1, Lwy0;->k:Z

    return-void

    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_55
        :pswitch_20
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-byte p1, p0, Lhy4;->a:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p1, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p1, Lb27;

    iget-boolean p0, p0, Lhy4;->c:Z

    invoke-interface {p1, p0}, Lb27;->p(Z)V

    return-void

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 5

    iget-byte v0, p0, Lhy4;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_3e

    :pswitch_6
    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    return-void

    :pswitch_a
    iget-object p1, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p1, Luif;

    iget-boolean p0, p0, Lhy4;->c:Z

    invoke-interface {p1, p0}, Luif;->b(Z)V

    return-void

    :pswitch_14
    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    iget-boolean v0, p0, Lhy4;->c:Z

    if-nez v0, :cond_2c

    iget-object p0, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p0, Li9c;

    sget-object v0, Lhjm;->b:Lhjm;

    const/4 v2, 0x0

    if-eq p1, v0, :cond_25

    move v1, v2

    :cond_25
    iget-object p0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast p0, Li16;

    invoke-virtual {p0, v2, v1}, Li16;->x(ZZ)V

    :cond_2c
    return-void

    :pswitch_2d
    iget-boolean p1, p0, Lhy4;->c:Z

    if-nez p1, :cond_3c

    iput-boolean v1, p0, Lhy4;->c:Z

    iget-object p0, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;

    iget-wide p0, p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;->b:J

    invoke-static {p0, p1}, LJ/N;->MyhGgz0G(J)V

    :cond_3c
    return-void

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_6
        :pswitch_14
        :pswitch_a
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    iget-byte v0, p0, Lhy4;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_58

    iput-boolean v2, p0, Lhy4;->c:Z

    iget-object v0, p0, Lhy4;->b:Ljava/lang/Object;

    check-cast v0, Ldb;

    invoke-virtual {v0, v2}, Ldb;->j(Z)V

    iget-object v0, p0, Lhy4;->d:Ljava/lang/Object;

    check-cast v0, Lbf9;

    invoke-virtual {v0}, Lbf9;->h()V

    const v0, 0x7f0a02a7

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/CheckBox;

    if-eqz p1, :cond_24

    iget-boolean v1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    :cond_24
    if-eqz v1, :cond_38

    iget-object p0, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p0, Luif;

    const/4 p1, 0x3

    invoke-static {p1}, Le35;->H0(I)Le35;

    move-result-object p1

    const/16 v0, 0x1001

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-interface {p0, p1}, Luif;->i(Lzhj;)V

    :cond_38
    return-void

    :pswitch_39
    iput-boolean v2, p0, Lhy4;->c:Z

    iget-object p0, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p0, Li9c;

    if-eqz p0, :cond_44

    invoke-virtual {p0}, Li9c;->g()V

    :cond_44
    return-void

    :pswitch_45
    iput-boolean v2, p0, Lhy4;->c:Z

    return-void

    :pswitch_48
    iget-boolean p1, p0, Lhy4;->c:Z

    if-nez p1, :cond_57

    iput-boolean v2, p0, Lhy4;->c:Z

    iget-object p0, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;

    iget-wide p0, p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;->b:J

    invoke-static {p0, p1, v1}, LJ/N;->M2LTxUAH(JI)V

    :cond_57
    return-void

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_48
        :pswitch_45
        :pswitch_39
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 5

    iget-byte v0, p0, Lhy4;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_3a

    :pswitch_6
    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_a
    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p0, Li9c;

    new-instance v1, Ly0a;

    const/4 v2, 0x6

    invoke-direct {v1, v0, v2}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Li9c;->g:Ljava/lang/Object;

    iget-boolean p0, p0, Li9c;->b:Z

    if-eqz p0, :cond_2a

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0}, Ly0a;->run(Ljava/lang/Object;)V

    :cond_2a
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_35

    const/16 p1, 0x10

    invoke-virtual {p0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    :cond_35
    return-void

    :pswitch_36
    invoke-static {p1, v1}, Lphj;->Q(Lbz0;Z)V

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_36
        :pswitch_6
        :pswitch_a
    .end packed-switch
.end method
