.class public final synthetic Lqp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp9n;
.implements Lxjj;
.implements Ljtl;
.implements Lxsi;
.implements Lvc3;
.implements Llo7;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lbcf;
.implements Ljr9;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lqp2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lqp2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge synthetic a()I
    .registers 1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT_FULL:I

    return v0
.end method

.method public static synthetic c()V
    .registers 1

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public static synthetic e(JLjava/lang/Object;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\\n not found: limit="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " content="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2026

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic f(Landroidx/fragment/app/Fragment;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " is already attached to a FragmentManager."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic g(Ljava/lang/Object;)V
    .registers 2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static synthetic j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic l(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic n(Ljava/lang/String;)V
    .registers 2

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic o(Ljava/lang/String;)V
    .registers 2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(Landroid/view/MenuItem;Z)V
    .registers 3

    xor-int/lit8 p2, p2, 0x1

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final d(I)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final h(Landroid/view/View;)V
    .registers 2

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    return-void
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 7

    iget-byte p0, p0, Lqp2;->a:B

    packed-switch p0, :pswitch_data_7e

    check-cast p1, Lkv2;

    check-cast p2, Ljv2;

    iget-object p0, p1, Lkv2;->a:Lpc;

    iget-object p1, p2, Ljv2;->e:Lpc;

    if-eq p0, p1, :cond_1e

    iget-object p1, p2, Ljv2;->b:Lov0;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    iput-object p0, p2, Ljv2;->e:Lpc;

    invoke-virtual {p2}, Ljv2;->U()V

    :cond_1e
    return-void

    :pswitch_1f
    check-cast p1, Lqq2;

    check-cast p2, Lpq2;

    iget-object p0, p1, Lqq2;->a:Lru2;

    iget-object p1, p2, Lpq2;->b:Lvs;

    iget-object v0, p2, Lpq2;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget v1, p0, Lru2;->d:I

    iget-object v2, p0, Lru2;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lj14;->b0(Lcom/opera/android/browser/chromium/ChromiumContent;I)Llxh;

    move-result-object v0

    if-eqz v0, :cond_4e

    iget-object v1, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    iget-object v3, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_4e
    iput-object p0, p2, Lpq2;->f:Lru2;

    iget-object v0, p1, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-object p1, p1, Lvs;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    iget-object v1, p0, Lru2;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget p2, p2, Lpq2;->e:I

    const/4 v0, 0x5

    if-ne p2, v0, :cond_7a

    iget p0, p0, Lru2;->e:I

    const/16 p2, 0x2b

    if-eq p0, p2, :cond_7a

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const-string p2, "*"

    invoke-static {p0, p2}, Lkotlin/text/c;->n(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_7d

    :cond_7a
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_7d
    return-void

    :pswitch_data_7e
    .packed-switch 0x1
        :pswitch_1f
    .end packed-switch
.end method

.method public final k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-byte v1, v1, Lqp2;->a:B

    const v3, 0x7f0a0a6a

    const v4, 0x7f0a06c5

    const v5, 0x7f0a0322

    const/4 v6, 0x0

    const-string v7, "Missing required view with ID: "

    const/4 v8, 0x0

    sparse-switch v1, :sswitch_data_258

    const v1, 0x7f0d01da

    invoke-virtual {v0, v1, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a09ba

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_81

    const v1, 0x7f0a09cd

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_81

    const v1, 0x7f0a09d0

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_81

    const v1, 0x7f0a09da

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v13, :cond_81

    const v1, 0x7f0a09ec

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_81

    const v1, 0x7f0a09fe

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_81

    const v1, 0x7f0a0a07

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_81

    new-instance v8, Lfl9;

    move-object v9, v0

    check-cast v9, Landroid/widget/LinearLayout;

    invoke-direct/range {v8 .. v16}, Lfl9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v6, v8

    goto :goto_90

    :cond_81
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_90
    return-object v6

    :sswitch_91
    const v1, 0x7f0d01d9

    invoke-virtual {v0, v1, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a006c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v10, :cond_d5

    const v1, 0x7f0a012f

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v11, :cond_d5

    const v1, 0x7f0a0343

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v12, :cond_d5

    const v1, 0x7f0a0344

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v13, :cond_d5

    new-instance v8, Lel9;

    move-object v9, v0

    check-cast v9, Landroid/widget/LinearLayout;

    invoke-direct/range {v8 .. v13}, Lel9;-><init>(Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V

    move-object v6, v8

    goto :goto_e4

    :cond_d5
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_e4
    return-object v6

    :sswitch_e5
    const v1, 0x7f0d01fa

    invoke-virtual {v0, v1, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    move-object v9, v0

    check-cast v9, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v10, :cond_155

    const v1, 0x7f0a0810

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v11, :cond_153

    const v1, 0x7f0a0812

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v12, :cond_153

    const v1, 0x7f0a0814

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_153

    const v1, 0x7f0a0a55

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v13, :cond_153

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_156

    invoke-static {v1}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v14

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v15, :cond_151

    const v3, 0x7f0a0a94

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_156

    invoke-static {v1}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v16

    new-instance v8, Ltn9;

    invoke-direct/range {v8 .. v16}, Ltn9;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lor2;Lcom/opera/android/custom_views/StylingTextView;Lor2;)V

    move-object v6, v8

    goto :goto_165

    :cond_151
    move v3, v4

    goto :goto_156

    :cond_153
    move v3, v1

    goto :goto_156

    :cond_155
    move v3, v5

    :cond_156
    :goto_156
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_165
    return-object v6

    :sswitch_166
    const v1, 0x7f0d01e0

    invoke-virtual {v0, v1, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    move-object v9, v0

    check-cast v9, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v10, :cond_1cb

    const v1, 0x7f0a0813

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v11, :cond_1c9

    const v1, 0x7f0a0815

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v12, :cond_1c9

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1cc

    invoke-static {v1}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v13

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v14, :cond_1c7

    const v3, 0x7f0a0c78

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v15, :cond_1cc

    const v3, 0x7f0a0c79

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v16, :cond_1cc

    new-instance v8, Lnl9;

    invoke-direct/range {v8 .. v16}, Lnl9;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lor2;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V

    move-object v6, v8

    goto :goto_1db

    :cond_1c7
    move v3, v4

    goto :goto_1cc

    :cond_1c9
    move v3, v1

    goto :goto_1cc

    :cond_1cb
    move v3, v5

    :cond_1cc
    :goto_1cc
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_1db
    return-object v6

    :sswitch_1dc
    const v1, 0x7f0d0077

    invoke-virtual {v0, v1, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0159

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_246

    invoke-static {v2}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v10

    const v1, 0x7f0a01d3

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_246

    invoke-static {v2}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v11

    const v1, 0x7f0a0407

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_246

    invoke-static {v2}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v12

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v13, :cond_244

    const v1, 0x7f0a073d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_246

    invoke-static {v2}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v14

    const v1, 0x7f0a0959

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_246

    invoke-static {v2}, Lor2;->a(Landroid/view/View;)Lor2;

    move-result-object v15

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v16, :cond_247

    new-instance v8, Lyq2;

    move-object v9, v0

    check-cast v9, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v8 .. v16}, Lyq2;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lor2;Lor2;Lor2;Lcom/opera/android/custom_views/StylingImageView;Lor2;Lor2;Lcom/opera/android/custom_views/StylingTextView;)V

    move-object v6, v8

    goto :goto_256

    :cond_244
    move v4, v5

    goto :goto_247

    :cond_246
    move v4, v1

    :cond_247
    :goto_247
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_256
    return-object v6

    nop

    :sswitch_data_258
    .sparse-switch
        0x2 -> :sswitch_1dc
        0x4 -> :sswitch_166
        0x6 -> :sswitch_e5
        0x10 -> :sswitch_91
    .end sparse-switch
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 4

    const/16 p0, 0x207

    iget-object v0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v0, p0}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget p0, p0, Lr9b;->b:I

    invoke-static {p0, p1}, Lp37;->q0(ILandroid/view/View;)V

    return-object p2
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 2

    return-void
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 4

    new-instance p0, Lzi3;

    const/16 v0, 0x11

    const-string v1, "blocklist_manifest"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0
.end method
