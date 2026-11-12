.class public final Lz9g;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Llag;

.field public final b:I

.field public c:Lkag;

.field public d:Z

.field public final synthetic e:Ljb;


# direct methods
.method public constructor <init>(Ljb;Llag;I)V
    .registers 5

    iput-object p1, p0, Lz9g;->e:Ljb;

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnz0;-><init>(ZZ)V

    iput-object p2, p0, Lz9g;->a:Llag;

    iput p3, p0, Lz9g;->b:I

    return-void
.end method


# virtual methods
.method public final b(ZZ)V
    .registers 6

    iget-boolean v0, p0, Lz9g;->d:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lz9g;->d:Z

    iget-object v1, p0, Lz9g;->e:Ljb;

    iget-boolean v2, v1, Ljb;->b:Z

    if-eqz v2, :cond_10

    if-nez p1, :cond_11

    :cond_10
    const/4 v0, 0x0

    :cond_11
    iget p0, p0, Lz9g;->b:I

    invoke-virtual {v1, p0, p2, v0}, Ljb;->d(IZZ)V

    return-void
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f14056d

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140180

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final isRequestValid(Lb2l;)Z
    .registers 7

    iget-object v0, p0, Lz9g;->e:Ljb;

    iget-object v1, v0, Ljb;->d:Ljava/lang/Object;

    check-cast v1, Lnrl;

    iget-object v2, v0, Ljb;->h:Ljava/io/Serializable;

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Ljb;->i:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    sget-object v3, Llag;->b:Llag;

    iget-object v4, p0, Lz9g;->a:Llag;

    if-eq v4, v3, :cond_19

    sget-object v3, Llag;->h:Llag;

    if-eq v4, v3, :cond_19

    move-object v2, v0

    :cond_19
    iget-object v0, v1, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Ls9g;

    iget-boolean v1, v1, Lnrl;->a:Z

    invoke-virtual {v0, v4, v2, v1}, Ls9g;->h(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v0

    sget-object v1, Lkag;->d:Lkag;

    if-eq v0, v1, :cond_2b

    iput-object v0, p0, Lz9g;->c:Lkag;

    const/4 p0, 0x0

    return p0

    :cond_2b
    invoke-super {p0, p1}, Lnz0;->isRequestValid(Lb2l;)Z

    move-result p0

    return p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 13

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p1, Laz0;->a:Lwy0;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v2, p0, Lz9g;->e:Ljb;

    iget-object v3, v2, Ljb;->h:Ljava/io/Serializable;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v2, Ljb;->i:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    sget-object v5, Llag;->b:Llag;

    iget-object p0, p0, Lz9g;->a:Llag;

    if-eq p0, v5, :cond_1f

    sget-object v5, Llag;->h:Llag;

    if-eq p0, v5, :cond_1f

    move-object v3, v4

    :cond_1f
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eq p0, v4, :cond_5e

    const/4 v4, 0x3

    if-eq p0, v4, :cond_57

    const/4 v4, 0x4

    if-eq p0, v4, :cond_50

    const/4 v4, 0x5

    if-eq p0, v4, :cond_50

    const/4 v4, 0x7

    if-eq p0, v4, :cond_48

    const/16 v4, 0x8

    if-eq p0, v4, :cond_3d

    move p0, v6

    move v4, p0

    move v7, v4

    :goto_3b
    move v8, v7

    goto :goto_65

    :cond_3d
    const p0, 0x7f140959

    const v4, 0x7f140958

    const v7, 0x7f08057e

    move v8, v5

    goto :goto_65

    :cond_48
    const p0, 0x7f140339

    const v4, 0x7f140338

    :goto_4e
    move v7, v6

    goto :goto_3b

    :cond_50
    const p0, 0x7f14134a

    const v4, 0x7f141349

    goto :goto_4e

    :cond_57
    const p0, 0x7f140d66

    const v4, 0x7f140d65

    goto :goto_4e

    :cond_5e
    const p0, 0x7f140806

    const v4, 0x7f140805

    goto :goto_4e

    :goto_65
    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v0, v4, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x0

    if-eqz v7, :cond_9e

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v10}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v10, 0x7f0d010b

    invoke-virtual {v0, v10, v9, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v6, 0x7f0a0322

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    const v6, 0x7f0a06c5

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-object v0, v1, Lwy0;->e:Landroid/view/View;

    goto :goto_a5

    :cond_9e
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    :goto_a5
    if-eqz v8, :cond_c4

    new-instance p0, Landroid/text/SpannableString;

    invoke-direct {p0, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_c1

    new-instance v4, Landroid/text/style/StyleSpan;

    invoke-direct {v4, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v0

    const/16 v6, 0x21

    invoke-virtual {p0, v4, v0, v3, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    :cond_c1
    iput-object p0, v1, Lwy0;->f:Ljava/lang/CharSequence;

    goto :goto_c6

    :cond_c4
    iput-object v4, v1, Lwy0;->f:Ljava/lang/CharSequence;

    :goto_c6
    iget-boolean p0, v2, Ljb;->b:Z

    if-eqz p0, :cond_d8

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f140e97

    invoke-static {p0, v0, v5, v9}, Lphj;->I(Landroid/content/Context;IZLav4;)Landroid/widget/FrameLayout;

    move-result-object p0

    invoke-virtual {p1, p0}, Laz0;->setView(Landroid/view/View;)Laz0;

    :cond_d8
    return-void
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 2

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 6

    iget-object v0, p0, Lz9g;->c:Lkag;

    if-eqz v0, :cond_10

    sget-object p1, Lkag;->b:Lkag;

    const/4 v1, 0x1

    if-ne v0, p1, :cond_b

    move p1, v1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, v1, p1}, Lz9g;->b(ZZ)V

    return-void

    :cond_10
    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_49

    iget-object p1, p0, Lz9g;->e:Ljb;

    iget v0, p1, Ljb;->c:I

    iget p0, p0, Lz9g;->b:I

    if-ne p0, v0, :cond_49

    iget-object p0, p1, Ljb;->g:Ljava/io/Serializable;

    check-cast p0, [Lcag;

    aget-object v1, p0, v0

    new-instance v2, Lcag;

    iget-object v1, v1, Lcag;->b:Ldag;

    sget-object v3, Lkag;->d:Lkag;

    invoke-direct {v2, v3, v1}, Lcag;-><init>(Lkag;Ldag;)V

    aput-object v2, p0, v0

    iget-object v0, p1, Ljb;->j:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;

    if-eqz v0, :cond_36

    invoke-virtual {v0, p0}, Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;->run(Ljava/lang/Object;)V

    :cond_36
    iget-object p0, p1, Ljb;->d:Ljava/lang/Object;

    check-cast p0, Lnrl;

    iget p1, p1, Ljb;->a:I

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Ls9g;

    iget-object p0, p0, Ls9g;->g:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_49
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 4

    iget-object v0, p0, Lz9g;->e:Ljb;

    iget-boolean v0, v0, Ljb;->b:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    const v0, 0x7f0a02a7

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/CheckBox;

    if-nez p1, :cond_14

    move p1, v1

    goto :goto_16

    :cond_14
    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    :goto_16
    if-eqz p1, :cond_1a

    const/4 p1, 0x1

    goto :goto_1b

    :cond_1a
    move p1, v1

    :goto_1b
    invoke-virtual {p0, p1, v1}, Lz9g;->b(ZZ)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    iget-object v0, p0, Lz9g;->e:Ljb;

    iget-boolean v0, v0, Ljb;->b:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1a

    const v0, 0x7f0a02a7

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/CheckBox;

    if-nez p1, :cond_15

    move p1, v2

    goto :goto_17

    :cond_15
    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    :goto_17
    if-eqz p1, :cond_1a

    move v2, v1

    :cond_1a
    invoke-virtual {p0, v2, v1}, Lz9g;->b(ZZ)V

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 2

    const/4 p0, 0x1

    invoke-static {p1, p0}, Lphj;->Q(Lbz0;Z)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->h(Landroid/content/Context;)V

    return-void
.end method

.method public final useTapStealingProtection()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method
