.class public final Lbg7;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lq6e;Lz4m;Lge5;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lbg7;->a:B

    const/4 v1, 0x0

    .line 23
    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    .line 24
    iput-object p1, p0, Lbg7;->b:Ljava/lang/Object;

    .line 25
    iput-object p2, p0, Lbg7;->c:Ljava/lang/Object;

    .line 26
    iput-object p3, p0, Lbg7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lre7;La32;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lbg7;->a:B

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lbg7;->b:Ljava/lang/Object;

    iput-object p2, p0, Lbg7;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lbg7;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ly4g;Lydn;Lqim;Lx5f;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lbg7;->a:B

    .line 18
    iput-object p1, p0, Lbg7;->e:Ljava/lang/Object;

    const/4 p1, 0x1

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, v0}, Lnz0;-><init>(ZZ)V

    .line 20
    iput-object p2, p0, Lbg7;->b:Ljava/lang/Object;

    .line 21
    iput-object p3, p0, Lbg7;->c:Ljava/lang/Object;

    .line 22
    iput-object p4, p0, Lbg7;->d:Ljava/lang/Object;

    return-void
.end method

.method public static b(Lydn;)I
    .registers 3

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lydn;->r()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_20

    invoke-virtual {p0}, Lydn;->m()I

    move-result v0

    if-nez v0, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    invoke-virtual {p0}, Lydn;->m()I

    move-result p0

    const/4 v0, 0x6

    if-ne p0, v0, :cond_20

    const/4 p0, 0x2

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final d()V
    .registers 3

    iget-object v0, p0, Lbg7;->c:Ljava/lang/Object;

    check-cast v0, Lqim;

    iget-object v0, v0, Lqim;->e:Lysj;

    new-instance v1, Lken;

    iget-object p0, p0, Lbg7;->b:Ljava/lang/Object;

    check-cast p0, Lydn;

    invoke-direct {v1, p0}, Lken;-><init>(Lydn;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    iget-byte v0, p0, Lbg7;->a:B

    const v1, 0x7f1403bf

    packed-switch v0, :pswitch_data_18

    :pswitch_8
    invoke-super {p0, p1}, Lnz0;->getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_12
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_12
        :pswitch_8
        :pswitch_d
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lbg7;->a:B

    packed-switch v0, :pswitch_data_1a

    :pswitch_5
    invoke-super {p0, p1}, Lnz0;->getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    const p0, 0x7f1412e1

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_12
    const p0, 0x7f14059a

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
        :pswitch_5
        :pswitch_a
    .end packed-switch
.end method

.method public final getTheme()I
    .registers 2

    iget-byte v0, p0, Lbg7;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lnz0;->getTheme()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f150291

    return p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final isRequestValid(Lb2l;)Z
    .registers 3

    iget-byte v0, p0, Lbg7;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Lnz0;->isRequestValid(Lb2l;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lbg7;->b:Ljava/lang/Object;

    check-cast p0, Lydn;

    invoke-static {p0}, Lbg7;->b(Lydn;)I

    move-result p0

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    goto :goto_17

    :cond_16
    const/4 p0, 0x0

    :goto_17
    return p0

    :pswitch_data_18
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 14

    iget-byte v0, p0, Lbg7;->a:B

    const/4 v1, -0x1

    const-string v2, "Missing required view with ID: "

    const/16 v3, 0xb

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    iget-object v7, p0, Lbg7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1aa

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v7, Lydn;

    invoke-static {v7}, Lbg7;->b(Lydn;)I

    move-result v1

    if-ne v1, v6, :cond_68

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v6, 0x7f0d0469

    invoke-virtual {v1, v6, v5, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v4, 0x7f0a02dd

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_58

    const v4, 0x7f0a0522

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/google/android/material/button/MaterialButton;

    if-eqz v6, :cond_58

    check-cast v1, Landroid/widget/LinearLayout;

    const v2, 0x7f1413b8

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Liyk;

    const/16 v7, 0x8

    invoke-direct {v4, p0, v0, v7}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v5, v2, v4}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    new-instance v0, Lpkm;

    invoke-direct {v0, p0, v3}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_ba

    :cond_58
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_c3

    :cond_68
    const/4 v2, 0x3

    const/4 v3, 0x2

    if-eq v1, v6, :cond_70

    if-ne v1, v3, :cond_95

    move v1, v2

    goto :goto_96

    :cond_70
    iget-object v1, v7, Lydn;->l:Landroid/content/Context;

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "vpn.vpnpro_first_enable_timestamp"

    const-wide/16 v7, 0x0

    invoke-interface {v1, v4, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    cmp-long v1, v9, v7

    if-eqz v1, :cond_89

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v9

    :cond_89
    const-wide/32 v9, 0x5265c00

    div-long/2addr v7, v9

    const-wide/16 v9, 0xe

    cmp-long v1, v7, v9

    if-gez v1, :cond_95

    move v1, v6

    goto :goto_96

    :cond_95
    move v1, v3

    :goto_96
    invoke-static {v0}, Lphj;->J(Landroid/content/Context;)Lcom/opera/android/custom_views/StylingTextView;

    move-result-object v4

    if-eq v1, v6, :cond_a9

    if-eq v1, v3, :cond_a5

    if-ne v1, v2, :cond_a4

    const v2, 0x7f1413b9

    goto :goto_ac

    :cond_a4
    throw v5

    :cond_a5
    const v2, 0x7f140518

    goto :goto_ac

    :cond_a9
    const v2, 0x7f14081e

    :goto_ac
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ltt2;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v1, v3}, Ltt2;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v4, v0, v2}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    move-object v1, v4

    :goto_ba
    const p0, 0x7f1413ba

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    invoke-virtual {p1, v1}, Laz0;->setView(Landroid/view/View;)Laz0;

    :goto_c3
    return-void

    :pswitch_c4
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-static {}, Lz4m;->values()[Lz4m;

    move-result-object v2

    array-length v3, v2

    move v5, v4

    :goto_e7
    if-ge v5, v3, :cond_11a

    aget-object v8, v2, v5

    invoke-static {v1, v0}, Lkf;->g(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lkf;

    move-result-object v9

    iget-object v9, v9, Lkf;->c:Ljava/lang/Object;

    check-cast v9, Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v10

    move-object v11, v7

    check-cast v11, Lq6e;

    invoke-virtual {v8, v11, v10}, Lz4m;->d(Lq6e;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v10, p0, Lbg7;->c:Ljava/lang/Object;

    check-cast v10, Lz4m;

    if-ne v8, v10, :cond_109

    move v10, v6

    goto :goto_10a

    :cond_109
    move v10, v4

    :goto_10a
    invoke-virtual {v9, v10}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    new-instance v10, Ljf7;

    const/16 v11, 0xe

    invoke-direct {v10, p0, v8, v11}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_e7

    :cond_11a
    const p0, 0x7f1410db

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :pswitch_124
    const v0, 0x7f1404c7

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v7, Lre7;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v6, 0x7f0d0109

    invoke-virtual {v0, v6, v5, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v6, 0x7f0a0362

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/OperaEditText;

    if-eqz v8, :cond_19a

    new-instance v2, Lkf;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {v2, v3, v0, v8}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object v2, p0, Lbg7;->e:Ljava/lang/Object;

    invoke-virtual {v7}, Lre7;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v7}, Lre7;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    if-ltz v2, :cond_16f

    :goto_161
    add-int/lit8 v3, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2e

    if-eq v6, v7, :cond_170

    if-ltz v3, :cond_16f

    move v2, v3

    goto :goto_161

    :cond_16f
    move v2, v1

    :cond_170
    iget-object v0, p0, Lbg7;->e:Ljava/lang/Object;

    check-cast v0, Lkf;

    if-eq v2, v1, :cond_181

    if-nez v0, :cond_179

    move-object v0, v5

    :cond_179
    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {v0, v4, v2}, Landroid/widget/EditText;->setSelection(II)V

    goto :goto_18b

    :cond_181
    if-nez v0, :cond_184

    move-object v0, v5

    :cond_184
    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    :goto_18b
    iget-object p0, p0, Lbg7;->e:Ljava/lang/Object;

    check-cast p0, Lkf;

    if-eqz p0, :cond_192

    move-object v5, p0

    :cond_192
    iget-object p0, v5, Lkf;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p1, p0}, Laz0;->setView(Landroid/view/View;)Laz0;

    goto :goto_1a9

    :cond_19a
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_1a9
    return-void

    :pswitch_data_1aa
    .packed-switch 0x0
        :pswitch_124
        :pswitch_c4
    .end packed-switch
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 4

    iget-byte v0, p0, Lbg7;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_16

    :pswitch_6
    invoke-super {p0, p1}, Lnz0;->onDialogCreated(Lbz0;)V

    return-void

    :pswitch_a
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void

    :pswitch_e
    invoke-super {p0, p1}, Lnz0;->onDialogCreated(Lbz0;)V

    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
        :pswitch_6
        :pswitch_a
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-byte p1, p0, Lbg7;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lbg7;->e:Ljava/lang/Object;

    check-cast p0, Ly4g;

    const/4 p1, 0x0

    iput-object p1, p0, Ly4g;->f:Ljava/lang/Object;

    return-void

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 5

    iget-byte v0, p0, Lbg7;->a:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Lbg7;->b:Ljava/lang/Object;

    check-cast p1, Lydn;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lydn;->C(Z)V

    iget-object p1, p0, Lbg7;->d:Ljava/lang/Object;

    check-cast p1, Lx5f;

    sget-object v0, Lwb0;->h:Lwb0;

    const/4 v1, 0x0

    const/4 v2, 0x7

    invoke-virtual {p1, v2, v0, v1}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    invoke-virtual {p0}, Lbg7;->d()V

    return-void

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 10

    iget-byte p1, p0, Lbg7;->a:B

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_e8

    :pswitch_6
    return-void

    :pswitch_7
    iget-object p1, p0, Lbg7;->d:Ljava/lang/Object;

    check-cast p1, Lx5f;

    const/4 v1, 0x7

    sget-object v2, Lwb0;->g:Lwb0;

    invoke-virtual {p1, v1, v2, v0}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    iget-object p0, p0, Lbg7;->b:Ljava/lang/Object;

    check-cast p0, Lydn;

    invoke-virtual {p0}, Lydn;->B()V

    return-void

    :pswitch_19
    iget-object p1, p0, Lbg7;->c:Ljava/lang/Object;

    check-cast p1, La32;

    iget-object p0, p0, Lbg7;->e:Ljava/lang/Object;

    check-cast p0, Lkf;

    if-nez p0, :cond_24

    move-object p0, v0

    :cond_24
    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    if-eqz p0, :cond_34

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    move-object v5, p0

    goto :goto_35

    :cond_34
    move-object v5, v0

    :goto_35
    iget-object p0, p1, La32;->b:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ljg7;

    iget-object p0, p1, La32;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    iget-object p1, p1, La32;->d:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lre7;

    iget-object p1, v2, Ljg7;->a:Lwg7;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Llg7;->a:[[I

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object v1

    invoke-static {p1, v1}, Llg7;->e(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p1

    if-nez p1, :cond_69

    invoke-static {}, Ls29;->c()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    :cond_69
    iget-object p1, v2, Ljg7;->b:Lrf7;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const/4 v7, 0x0

    invoke-virtual {p1, v1, v7}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object p1

    if-eqz p1, :cond_8c

    invoke-virtual {p1}, Lre7;->q()Z

    move-result v1

    if-eqz v1, :cond_8c

    invoke-virtual {p1}, Lre7;->a()Z

    move-result v1

    if-eqz v1, :cond_8c

    move-object v3, p1

    goto :goto_8d

    :cond_8c
    move-object v3, v0

    :goto_8d
    if-eqz v3, :cond_e4

    const p1, 0x7f1405d4

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_9f

    new-instance v1, Lqxh;

    invoke-direct {v1, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object p1, v1

    goto :goto_a0

    :cond_9f
    move-object p1, v0

    :goto_a0
    new-instance v1, Lws1;

    const/4 v6, 0x6

    invoke-direct/range {v1 .. v6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lgkj;

    invoke-direct {v2, v7, v7}, Lnz0;-><init>(ZZ)V

    iput-object v0, v2, Lgkj;->a:Ljava/lang/String;

    iput-object v0, v2, Lgkj;->b:Ljava/lang/String;

    iput-object v0, v2, Lgkj;->c:Ljava/lang/String;

    iput-object v0, v2, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v0, v2, Lgkj;->e:Lekj;

    iput-object v0, v2, Lgkj;->f:Lfkj;

    iput-object v0, v2, Lgkj;->g:Lqp2;

    iput-object v1, v2, Lgkj;->h:Ldkj;

    iput-object v0, v2, Lgkj;->i:Ldkj;

    iput-object v0, v2, Lgkj;->j:Lql;

    const v0, 0x7f140bbb

    iput v0, v2, Lgkj;->k:I

    const v0, 0x7f1403bf

    iput v0, v2, Lgkj;->l:I

    const v0, 0x7f1405d5

    iput v0, v2, Lgkj;->m:I

    const/4 v0, 0x1

    iput-boolean v0, v2, Lgkj;->n:Z

    iput-object p1, v2, Lgkj;->o:Lpxh;

    const-string p1, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v2, p1}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_e7

    :cond_e4
    invoke-virtual {v2, v4, v5}, Ljg7;->e(Lre7;Ljava/lang/String;)V

    :goto_e7
    return-void

    :pswitch_data_e8
    .packed-switch 0x0
        :pswitch_19
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 7

    iget-byte v0, p0, Lbg7;->a:B

    packed-switch v0, :pswitch_data_5a

    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    iput-object p1, p0, Lbg7;->e:Ljava/lang/Object;

    return-void

    :pswitch_f
    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, p0, Lbg7;->e:Ljava/lang/Object;

    check-cast v1, Lkf;

    const/4 v2, 0x0

    if-nez v1, :cond_23

    move-object v1, v2

    :cond_23
    iget-object v1, v1, Lkf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/OperaEditText;

    new-instance v3, Lpu;

    const/4 v4, 0x1

    invoke-direct {v3, v0, p0, v4}, Lpu;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p0, p0, Lbg7;->e:Ljava/lang/Object;

    check-cast p0, Lkf;

    if-eqz p0, :cond_37

    move-object v2, p0

    :cond_37
    iget-object p0, v2, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaEditText;

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_59

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_59

    new-instance p1, Lma3;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Lma3;-><init>(B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_59
    return-void

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_f
        :pswitch_9
    .end packed-switch
.end method
