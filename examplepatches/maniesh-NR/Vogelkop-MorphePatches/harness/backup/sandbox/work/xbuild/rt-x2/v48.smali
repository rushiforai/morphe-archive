.class public final Lv48;
.super Landroid/app/AlertDialog;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luim;


# direct methods
.method public constructor <init>(Luim;Landroid/content/Context;B)V
    .registers 4

    iput-byte p3, p0, Lv48;->a:B

    iput-object p1, p0, Lv48;->b:Luim;

    const p1, 0x7f150295

    invoke-direct {p0, p2, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0d0367

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setContentView(I)V

    const p1, 0x7f0a02dc

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lgf;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v0, 0x20008

    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p1

    invoke-virtual {p1}, Ldb;->d()Z

    move-result v0

    const v1, 0x7f0a0a94

    if-eqz v0, :cond_47

    invoke-virtual {p0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object p0

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_47
    invoke-virtual {p0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p1}, Ldb;->c()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Lv48;->a:B

    const-string v2, "Missing required view with ID: "

    const v3, 0x7f1403bf

    const v4, 0x102001a

    const v5, 0x1020019

    const v6, 0x7f0a0274

    iget-object v7, v0, Lv48;->b:Luim;

    const/4 v8, 0x1

    const/4 v9, 0x2

    const/4 v10, 0x0

    packed-switch v1, :pswitch_data_1d0

    invoke-virtual/range {p0 .. p1}, Lv48;->a(Landroid/os/Bundle;)V

    check-cast v7, Lf0i;

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v0, v6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const v11, 0x7f0d0366

    invoke-virtual {v1, v11, v6, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v6, 0x7f0a02d0

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v14, v11

    check-cast v14, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v14, :cond_11d

    const v6, 0x7f0a041c

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v15, v11

    check-cast v15, Lcom/google/android/material/button/MaterialButton;

    if-eqz v15, :cond_11d

    const v6, 0x7f0a04a3

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v11, :cond_11d

    const v6, 0x7f0a0810

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v16, v11

    check-cast v16, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v16, :cond_11d

    const v6, 0x7f0a0811

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v17, v11

    check-cast v17, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v17, :cond_11d

    const v6, 0x7f0a08e0

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v18, v11

    check-cast v18, Lcom/google/android/material/button/MaterialButton;

    if-eqz v18, :cond_11d

    const v6, 0x7f0a094b

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/LinearLayout;

    if-eqz v11, :cond_11d

    move-object v13, v1

    check-cast v13, Landroid/widget/LinearLayout;

    const v6, 0x7f0a0cd5

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v19, v11

    check-cast v19, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v19, :cond_11d

    new-instance v12, Ly83;

    const/16 v20, 0x9

    invoke-direct/range {v12 .. v20}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    iput-object v12, v7, Lf0i;->g:Ly83;

    iget-object v1, v7, Lf0i;->f:Ldb;

    iget-object v2, v7, Lf0i;->i:Lcom/opera/android/autofill/PasswordManager;

    new-instance v6, Lzzh;

    invoke-direct {v6, v0, v9}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Lcom/opera/android/autofill/PasswordManager;->a(Lcom/opera/api/Callback;)V

    iget-object v2, v7, Lf0i;->g:Ly83;

    iget-object v2, v2, Ly83;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v6, Lmj2;

    const/16 v11, 0xc

    invoke-direct {v6, v0, v11}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v1}, Ldb;->d()Z

    move-result v2

    iget-object v6, v7, Lf0i;->g:Ly83;

    if-eqz v2, :cond_d6

    iget-object v2, v6, Ly83;->g:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    const/16 v6, 0x8

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e2

    :cond_d6
    iget-object v2, v6, Ly83;->g:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    new-instance v6, Le0i;

    invoke-direct {v6, v0, v10}, Le0i;-><init>(Lv48;B)V

    invoke-virtual {v2, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_e2
    iget-object v2, v7, Lf0i;->g:Ly83;

    iget-object v2, v2, Ly83;->d:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    new-instance v6, Le0i;

    invoke-direct {v6, v0, v8}, Le0i;-><init>(Lv48;B)V

    invoke-virtual {v2, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, v7, Lf0i;->h:Landroid/widget/Button;

    invoke-virtual {v2, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    new-instance v3, Le0i;

    invoke-direct {v3, v0, v9}, Le0i;-><init>(Lv48;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_119

    invoke-virtual {v7, v8}, Lf0i;->o0(I)V

    goto :goto_12c

    :cond_119
    invoke-virtual {v7, v9}, Lf0i;->o0(I)V

    goto :goto_12c

    :cond_11d
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_12c
    return-void

    :pswitch_12d
    invoke-virtual/range {p0 .. p1}, Lv48;->a(Landroid/os/Bundle;)V

    check-cast v7, Lw48;

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v0, v6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    const v11, 0x7f0d0125

    invoke-virtual {v1, v11, v6, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v6, 0x7f0a080e

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v14, v11

    check-cast v14, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v14, :cond_1bf

    const v6, 0x7f0a080f

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object v15, v11

    check-cast v15, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v15, :cond_1bf

    const v6, 0x7f0a08dd

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    move-object/from16 v16, v11

    check-cast v16, Lcom/google/android/material/button/MaterialButton;

    if-eqz v16, :cond_1bf

    new-instance v12, Lvs;

    move-object v13, v1

    check-cast v13, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/16 v17, 0xa

    invoke-direct/range {v12 .. v17}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v12, v7, Lw48;->d:Lvs;

    new-instance v1, Lmj2;

    const/16 v2, 0x9

    invoke-direct {v1, v0, v2}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v1, v7, Lw48;->d:Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lu48;

    invoke-direct {v2, v0, v10}, Lu48;-><init>(Lv48;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v10}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f14059a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    new-instance v2, Lu48;

    invoke-direct {v2, v0, v8}, Lu48;-><init>(Lv48;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    new-instance v2, Lu48;

    invoke-direct {v2, v0, v9}, Lu48;-><init>(Lv48;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1ce

    :cond_1bf
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_1ce
    return-void

    nop

    :pswitch_data_1d0
    .packed-switch 0x0
        :pswitch_12d
    .end packed-switch
.end method
