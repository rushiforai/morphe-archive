.class public final Lev2;
.super Lz46;
.source "SourceFile"


# instance fields
.field public final u:Ljava/lang/String;

.field public final v:Ls3g;

.field public final w:Lrxh;

.field public final x:Lrxh;

.field public y:Lor2;

.field public z:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ls3g;Lrxh;Lrxh;Lav2;)V
    .registers 9

    new-instance v0, Ldkf;

    const v1, 0x7f150054

    invoke-direct {v0, p1, v1}, Ldkf;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Lz46;-><init>(Landroid/content/Context;I)V

    iput-object p2, p0, Lev2;->u:Ljava/lang/String;

    iput-object p3, p0, Lev2;->v:Ls3g;

    iput-object p4, p0, Lev2;->w:Lrxh;

    iput-object p5, p0, Lev2;->x:Lrxh;

    new-instance p1, Liz0;

    const/4 p2, 0x1

    invoke-direct {p1, p6, p0, p2}, Liz0;-><init>(Ljava/lang/Object;Lzp1;B)V

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 20

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Ltq3;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0088

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0191

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    const-string v6, "Missing required view with ID: "

    if-eqz v5, :cond_1aa

    move-object v8, v1

    check-cast v8, Landroid/widget/FrameLayout;

    const v2, 0x7f0a074b

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v9, :cond_1aa

    const v2, 0x7f0a0810

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1aa

    const v7, 0x7f0a0046

    invoke-static {v7, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object v13, v10

    check-cast v13, Landroid/widget/ImageView;

    if-eqz v13, :cond_199

    const v7, 0x7f0a0322

    invoke-static {v7, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object v14, v10

    check-cast v14, Landroid/widget/ImageView;

    if-eqz v14, :cond_199

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v15, v7

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_19a

    const v2, 0x7f0a0a94

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v16, v7

    check-cast v16, Landroid/widget/TextView;

    if-eqz v16, :cond_19a

    new-instance v10, Lor2;

    move-object v12, v5

    check-cast v12, Landroid/widget/LinearLayout;

    const/16 v17, 0x15

    move-object v11, v10

    invoke-direct/range {v11 .. v17}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v2, 0x7f0a084d

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v11, :cond_1aa

    const v2, 0x7f0a06c5

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v12, :cond_1aa

    new-instance v7, Lor2;

    const/4 v13, 0x3

    invoke-direct/range {v7 .. v13}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v7, v0, Lev2;->y:Lor2;

    invoke-virtual {v0, v8}, Lz46;->setContentView(Landroid/view/View;)V

    iget-object v1, v0, Lev2;->y:Lor2;

    if-nez v1, :cond_9c

    move-object v1, v3

    :cond_9c
    iget-object v2, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v2, Lor2;

    iget-object v5, v2, Lor2;->e:Ljava/lang/Object;

    check-cast v5, Landroid/widget/ImageView;

    iget-object v6, v0, Lev2;->v:Ls3g;

    iget-object v7, v6, Ls3g;->b:Ljava/lang/String;

    const-string v8, "android"

    invoke-static {v7, v8, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_ca

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v7

    iget-object v8, v6, Ls3g;->b:Ljava/lang/String;

    invoke-static {v7, v8}, Lrab;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v7

    if-eqz v7, :cond_ca

    new-instance v8, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-direct {v8, v9, v7}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    goto :goto_d5

    :cond_ca
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f0805c7

    invoke-static {v8, v7}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    :goto_d5
    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v5, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v5, Landroid/widget/TextView;

    iget-object v7, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v7, Landroid/widget/ImageView;

    iget-object v6, v6, Ls3g;->d:Ljava/lang/String;

    if-eqz v6, :cond_ed

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-gtz v8, :cond_eb

    move-object v6, v3

    :cond_eb
    if-nez v6, :cond_f8

    :cond_ed
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v6

    const v8, 0x7f1402ac

    invoke-virtual {v6, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    :cond_f8
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    const-string v5, "********"

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v7, v4}, Landroid/view/View;->setVisibility(I)V

    new-instance v2, Lcv2;

    invoke-direct {v2, v1, v0, v4}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Llqh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iget-boolean v5, v1, Llqh;->a:Z

    if-eqz v5, :cond_119

    const v5, 0x7f080624

    goto :goto_11c

    :cond_119
    const v5, 0x7f080625

    :goto_11c
    invoke-virtual {v7, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    new-instance v5, Ldv2;

    invoke-direct {v5, v1, v2, v7, v4}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lev2;->y:Lor2;

    if-nez v1, :cond_12c

    move-object v1, v3

    :cond_12c
    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v2, v0, Lev2;->u:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lev2;->y:Lor2;

    if-nez v1, :cond_13b

    move-object v2, v3

    goto :goto_13c

    :cond_13b
    move-object v2, v1

    :goto_13c
    iget-object v2, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-nez v1, :cond_143

    move-object v1, v3

    :cond_143
    iget-object v1, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v5, v0, Lev2;->w:Lrxh;

    invoke-virtual {v5, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lev2;->y:Lor2;

    if-nez v1, :cond_159

    move-object v1, v3

    :cond_159
    iget-object v1, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v2, Lbv2;

    invoke-direct {v2, v0, v4}, Lbv2;-><init>(Lev2;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lev2;->x:Lrxh;

    if-eqz v1, :cond_198

    iget-object v2, v0, Lev2;->y:Lor2;

    if-nez v2, :cond_16f

    move-object v4, v3

    goto :goto_170

    :cond_16f
    move-object v4, v2

    :goto_170
    iget-object v4, v4, Lor2;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-nez v2, :cond_177

    move-object v2, v3

    :cond_177
    iget-object v2, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lev2;->y:Lor2;

    if-eqz v1, :cond_18b

    move-object v3, v1

    :cond_18b
    iget-object v1, v3, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v2, Lbv2;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lbv2;-><init>(Lev2;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_198
    return-void

    :cond_199
    move v2, v7

    :cond_19a
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1aa
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
