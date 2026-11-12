.class public final Lxol;
.super Lygc;
.source "SourceFile"


# static fields
.field public static final d:Lcs;


# instance fields
.field public final synthetic b:B

.field public c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcs;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lcs;-><init>(B)V

    sput-object v0, Lxol;->d:Lcs;

    return-void
.end method

.method public synthetic constructor <init>(Lgyg;)V
    .registers 3

    .line 20
    const/4 v0, 0x3

    iput-byte v0, p0, Lxol;->b:B

    invoke-direct {p0, p1}, Lygc;-><init>(Lgyg;)V

    return-void
.end method

.method public constructor <init>(Li0h;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lxol;->b:B

    .line 21
    iput-object p1, p0, Lxol;->c:Ljava/lang/Object;

    .line 22
    sget-object p1, Li0h;->f:Lcs;

    invoke-direct {p0, p1}, Lygc;-><init>(Lgyg;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Lhy7;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lxol;->b:B

    new-instance v0, Lcs;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcs;-><init>(B)V

    invoke-direct {p0, v0}, Lygc;-><init>(Lgyg;)V

    iput-object p2, p0, Lxol;->c:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lygc;->H(Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ly53;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lxol;->b:B

    .line 18
    sget-object v0, Lxol;->d:Lcs;

    invoke-direct {p0, v0}, Lygc;-><init>(Lgyg;)V

    iput-object p1, p0, Lxol;->c:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public final I(Lk7o;)V
    .registers 5

    iput-object p1, p0, Lxol;->c:Ljava/lang/Object;

    if-eqz p1, :cond_2c

    iget-object p1, p1, Lk7o;->g:Ljava/util/Set;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_17
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr7o;

    new-instance v2, Le7o;

    invoke-direct {v2, v1}, Le7o;-><init>(Lr7o;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_2c
    const/4 v0, 0x0

    :cond_2d
    invoke-virtual {p0, v0}, Lygc;->H(Ljava/util/List;)V

    return-void
.end method

.method public final getItemId(I)J
    .registers 3

    iget-byte v0, p0, Lxol;->b:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide p0

    return-wide p0

    :pswitch_a
    invoke-virtual {p0, p1}, Lygc;->G(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwol;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    int-to-long p0, p0

    return-wide p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final getItemViewType(I)I
    .registers 3

    iget-byte v0, p0, Lxol;->b:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemViewType(I)I

    move-result p0

    return p0

    :pswitch_a
    invoke-virtual {p0, p1}, Lygc;->G(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le7o;

    if-eqz p0, :cond_14

    :goto_12
    const/4 p0, 0x0

    goto :goto_18

    :cond_14
    invoke-static {}, Lh9o;->p()V

    goto :goto_12

    :goto_18
    return p0

    nop

    :pswitch_data_1a
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 14

    iget-byte v0, p0, Lxol;->b:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_1ce

    invoke-virtual {p0, p2}, Lygc;->G(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le7o;

    if-eqz p2, :cond_a1

    iget-object v0, p2, Le7o;->a:Lr7o;

    check-cast p1, Lf7o;

    new-instance v4, Lnqi;

    const/16 v5, 0x15

    invoke-direct {v4, p0, v5}, Lnqi;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lf7o;->b:Lq5g;

    iget-object v5, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v6, v0, Lr7o;->c:Lrxh;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v6, v7}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast v5, Landroid/widget/ImageView;

    iget-object v0, v0, Lr7o;->d:Llxh;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0, v6}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v6, p1, Lf7o;->c:I

    iget v7, p1, Lf7o;->d:F

    iget-object p1, p1, Lf7o;->b:Lq5g;

    iget-object p1, p1, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v8, 0x7f0402d4

    const v9, 0x7f06063b

    invoke-static {v8, p1, v9}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    instance-of v8, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v8, :cond_5b

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    goto :goto_5c

    :cond_5b
    move-object v0, v2

    :goto_5c
    if-eqz v0, :cond_8f

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_8f

    new-instance v2, Lc7o;

    new-instance v8, Lhq4;

    const/4 v9, -0x1

    invoke-direct {v8, v0, v9}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    new-instance v0, Lp05;

    invoke-direct {v0, v7, p1, v9}, Lp05;-><init>(FII)V

    const/4 p1, 0x2

    new-array p1, p1, [Landroid/graphics/drawable/Drawable;

    aput-object v8, p1, v1

    aput-object v0, p1, v3

    invoke-direct {v2, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    int-to-float p1, v6

    const/high16 v0, 0x40000000    # 2.0f

    mul-float/2addr v0, v7

    sub-float/2addr p1, v0

    float-to-int p1, p1

    const/16 v0, 0x11

    invoke-virtual {v2, v1, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v2, v1, p1, p1}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v2, v3, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v2, v3, v6, v6}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    :cond_8f
    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p0, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/LinearLayout;

    new-instance p1, Ldv2;

    const/16 v0, 0x9

    invoke-direct {p1, v4, p0, p2, v0}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_a4

    :cond_a1
    invoke-static {}, Lh9o;->p()V

    :goto_a4
    return-void

    :pswitch_a5
    check-cast p1, Lg0h;

    invoke-virtual {p0, p2}, Lygc;->G(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/Pair;

    iget-object p2, p1, Lg0h;->b:Lkf;

    iget-object v0, p2, Lkf;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v4, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Llag;

    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Lkag;

    invoke-static {v4, p0}, Lui6;->z(Llag;Lkag;)I

    move-result v5

    invoke-static {v5, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iget-object p2, p2, Lkf;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p2, v5, v2}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-static {v1, v4}, Lui6;->S(Landroid/content/Context;Llag;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, " \u2014\u00a0"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p1, Lg0h;->c:Lxol;

    iget-object v7, v7, Lxol;->c:Ljava/lang/Object;

    check-cast v7, Li0h;

    iget-object v8, v7, Li0h;->b:Lp0h;

    iget-object v8, v8, Lp0h;->e:Lkze;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v4, p0, v8}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v8, Landroid/text/SpannableStringBuilder;

    invoke-direct {v8}, Landroid/text/SpannableStringBuilder;-><init>()V

    new-instance v9, Landroid/text/style/TextAppearanceSpan;

    const v10, 0x7f1502dc

    invoke-direct {v9, v1, v10}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    const/16 v10, 0x21

    invoke-virtual {v8, v5, v9, v10}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    new-instance v8, Landroid/text/style/TextAppearanceSpan;

    const v9, 0x7f1502dd

    invoke-direct {v8, v1, v9}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v5, v6, v8, v10}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, v7, Li0h;->b:Lp0h;

    iget-object v1, v1, Lp0h;->g:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_12e

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_13a

    :cond_12e
    invoke-virtual {v0, v3}, Landroid/view/View;->setFocusable(Z)V

    new-instance p2, Ldv2;

    const/4 v1, 0x5

    invoke-direct {p2, p1, v4, p0, v1}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_13a
    return-void

    :pswitch_13b
    check-cast p1, Lpz7;

    invoke-virtual {p0, p2}, Lygc;->G(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    iput-object p0, p1, Lpz7;->c:Ljava/lang/String;

    iget-object p1, p1, Lpz7;->b:Lcq3;

    iget-object p1, p1, Lcq3;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/hype/emoji/EmojiTextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_14f
    check-cast p1, Lapl;

    invoke-virtual {p0, p2}, Lygc;->G(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwol;

    iget-object p2, p1, Lapl;->h:Lkze;

    invoke-virtual {p1}, Lapl;->U()V

    iput-object p0, p1, Lapl;->d:Lwol;

    iget-object v0, p1, Lapl;->b:Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    iget v4, p0, Lwol;->a:I

    iput v4, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->d:I

    invoke-virtual {v0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->c()V

    iget v4, p0, Lwol;->b:I

    iput v4, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->c:I

    iget-object v4, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b:Lpt1;

    iget-object v4, v4, Lpt1;->f:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v6, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->c:I

    invoke-static {v6, v5}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v4, p1, Lapl;->c:Ly53;

    invoke-virtual {v4, p0}, Ly53;->S(Lwol;)Lp1f;

    move-result-object v5

    if-eqz v5, :cond_18b

    invoke-virtual {v5}, Lp1f;->a()Z

    move-result v5

    goto :goto_18c

    :cond_18b
    move v5, v1

    :goto_18c
    iput-boolean v5, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->e:Z

    invoke-virtual {v0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->a()V

    invoke-virtual {v4, p0}, Ly53;->S(Lwol;)Lp1f;

    move-result-object v5

    if-eqz v5, :cond_19c

    iget-object v6, p1, Lapl;->e:Lj7d;

    invoke-static {v5, p2, v6}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    :cond_19c
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_1a4

    if-ne p0, v3, :cond_1af

    :cond_1a4
    iget-object p0, v4, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->y:Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lekc;

    :cond_1af
    iput-object v2, p1, Lapl;->g:Lekc;

    if-eqz v2, :cond_1bd

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1bd
    iget-boolean p0, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    if-eq p0, v1, :cond_1c6

    iput-boolean v1, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    invoke-virtual {v0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b()V

    :cond_1c6
    if-eqz v2, :cond_1cd

    iget-object p0, p1, Lapl;->f:Lg9l;

    invoke-static {v2, p2, p0}, La26;->T(Lekc;Likc;Lf7f;)V

    :cond_1cd
    return-void

    :pswitch_data_1ce
    .packed-switch 0x0
        :pswitch_14f
        :pswitch_13b
        :pswitch_a5
    .end packed-switch
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 8

    iget-byte p2, p0, Lxol;->b:B

    const-string v0, "rootView"

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch p2, :pswitch_data_b4

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    new-instance p2, Lf7o;

    const v0, 0x7f0d049d

    invoke-virtual {p0, v0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a04b5

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_3e

    const p1, 0x7f0a0b5e

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v2, :cond_3e

    new-instance p1, Lq5g;

    check-cast p0, Landroid/widget/LinearLayout;

    const/16 v1, 0x11

    invoke-direct {p1, p0, v0, v2, v1}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, p1}, Lf7o;-><init>(Lq5g;)V

    move-object v1, p2

    goto :goto_4f

    :cond_3e
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_4f
    return-object v1

    :pswitch_50
    new-instance p2, Lg0h;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d00cd

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lkf;->c(Landroid/view/View;)Lkf;

    move-result-object p1

    iget-object p1, p1, Lkf;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    invoke-direct {p2, p0, p1}, Lg0h;-><init>(Lxol;Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;)V

    return-object p2

    :pswitch_6d
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    new-instance v3, Lpz7;

    const v4, 0x7f0d020c

    invoke-virtual {p2, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_91

    new-instance p2, Lcq3;

    check-cast p1, Lcom/opera/hype/emoji/EmojiTextView;

    const/4 v0, 0x2

    invoke-direct {p2, p1, v0}, Lcq3;-><init>(Landroid/view/View;B)V

    iget-object p0, p0, Lxol;->c:Ljava/lang/Object;

    check-cast p0, Lhy7;

    invoke-direct {v3, p2, p0}, Lpz7;-><init>(Lcq3;Lhy7;)V

    move-object v1, v3

    goto :goto_94

    :cond_91
    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_94
    return-object v1

    :pswitch_95
    new-instance p2, Lapl;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0266

    invoke-virtual {v3, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_af

    check-cast p1, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    iget-object p0, p0, Lxol;->c:Ljava/lang/Object;

    check-cast p0, Ly53;

    invoke-direct {p2, p1, p0}, Lapl;-><init>(Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;Ly53;)V

    move-object v1, p2

    goto :goto_b2

    :cond_af
    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_b2
    return-object v1

    nop

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_95
        :pswitch_6d
        :pswitch_50
    .end packed-switch
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte v0, p0, Lxol;->b:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_9
    check-cast p1, Lapl;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p1}, Lapl;->U()V

    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
