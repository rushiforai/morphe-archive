.class public Ll/d650;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText;

.field public C:Landroid/widget/RelativeLayout;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Landroid/view/View;

.field public G:Lcom/p1/mobile/android/app/Act;

.field public H:Lcom/p1/mobile/putong/data/PayMethod;

.field public I:Ll/x20;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public J:Ljava/text/DecimalFormat;

.field public K:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public L:Lcom/p1/mobile/putong/core/data/Coupon;

.field public M:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public N:Lcom/p1/mobile/putong/core/data/Coupon;

.field public O:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public P:Lcom/p1/mobile/putong/core/data/Coupon;

.field public Q:Lcom/p1/mobile/putong/core/data/Coupon;

.field public R:Ljava/lang/String;

.field public S:Ll/l4g0;

.field public T:D

.field public U:Ll/wn60;

.field public j:Lcom/tantan/library/svga/SVGAnimationView;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lv/VLinear;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VLinear;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/dgc0;->b:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/text/DecimalFormat;

    .line 8
    .line 9
    const-string v1, "#.#"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/d650;->J:Ljava/text/DecimalFormat;

    .line 15
    .line 16
    iput-object p1, p0, Ll/d650;->G:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    new-instance p1, Ll/c650;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Ll/c650;-><init>(Ll/d650;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/d650;->I:Ll/x20;

    .line 24
    .line 25
    iput-object p6, p0, Ll/d650;->R:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p2, p0, Ll/d650;->K:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 28
    .line 29
    iput-object p3, p0, Ll/d650;->Q:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 30
    .line 31
    iput-object p3, p0, Ll/d650;->L:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 32
    .line 33
    iput-object p4, p0, Ll/d650;->M:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 34
    .line 35
    iput-object p5, p0, Ll/d650;->N:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic E(Ll/d650;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/d650;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->c0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic G(Ll/d650;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d650;->g0(Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method

.method public static synthetic H(Ll/d650;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/d650;->V(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic I(Ll/d650;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->e0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic J(Ll/d650;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d650;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/d650;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->W(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic L(Ll/d650;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/d650;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->f0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic N(Ll/d650;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->d0(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O(Ll/d650;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d650;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Ll/d650;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d650;->b0(Landroid/view/View;)V

    return-void
.end method

.method private S()V
    .locals 2

    .line 1
    new-instance v0, Ll/q550;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/q550;-><init>(Ll/d650;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/u550;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/u550;-><init>(Ll/d650;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/d650;->k:Lv/VImage;

    .line 18
    .line 19
    new-instance v1, Ll/v550;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/v550;-><init>(Ll/d650;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/d650;->m:Lv/VLinear;

    .line 28
    .line 29
    new-instance v1, Ll/w550;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/w550;-><init>(Ll/d650;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/d650;->t:Lv/VLinear;

    .line 38
    .line 39
    new-instance v1, Ll/x550;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/x550;-><init>(Ll/d650;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/d650;->A:Lv/VText;

    .line 48
    .line 49
    new-instance v1, Ll/y550;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/y550;-><init>(Ll/d650;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/d650;->C:Landroid/widget/RelativeLayout;

    .line 58
    .line 59
    new-instance v1, Ll/z550;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/z550;-><init>(Ll/d650;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private T()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/d650;->k:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->F0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sget v2, Ll/qa00;->g:I

    .line 14
    .line 15
    add-int/2addr v1, v2

    .line 16
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 17
    .line 18
    iget-object v0, p0, Ll/d650;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 25
    .line 26
    invoke-static {}, Ll/bnl0;->F0()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    add-int/2addr v1, v2

    .line 31
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 32
    .line 33
    iget-object v0, p0, Ll/d650;->G:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "https://auto.tancdn.com/v1/raw/9a15b83d-2300-4a62-8059-bf2da05730b514.pdf"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v2, -0x1

    .line 51
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v2, p0, Ll/d650;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0}, Ll/d650;->S()V

    .line 61
    .line 62
    .line 63
    new-instance v0, Landroid/text/SpannableString;

    .line 64
    .line 65
    const-string v2, "\u89e3\u9501\u540e\u914d\u5bf9\u6700\u9ad8\u589e\u52a020\u500d"

    .line 66
    .line 67
    invoke-direct {v0, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    new-instance v2, Landroid/text/style/StyleSpan;

    .line 71
    .line 72
    invoke-direct {v2, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 73
    .line 74
    .line 75
    const/16 v1, 0xb

    .line 76
    .line 77
    const/16 v3, 0x21

    .line 78
    .line 79
    const/16 v4, 0x9

    .line 80
    .line 81
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Ll/d650;->l:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/d650;->K:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 90
    .line 91
    iget-object v1, p0, Ll/d650;->L:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 92
    .line 93
    invoke-virtual {p0, v0, v1}, Ll/d650;->R(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/d650;->k0()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/d650;->j0()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/d650;->i0()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d650;->I:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d650;->U(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/d650;->K:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iget-object v0, p0, Ll/d650;->L:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Ll/d650;->R(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private g0(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    const-string v0, "alipay"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/d650;->D:Lv/VText;

    .line 13
    .line 14
    const-string v1, "\u652f\u4ed8\u5b9d"

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/d650;->D:Lv/VText;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/jbc0;->C6:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1, v1, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object p1, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 38
    .line 39
    const-string v1, "wechat"

    .line 40
    .line 41
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Ll/d650;->D:Lv/VText;

    .line 48
    .line 49
    const-string v1, "\u5fae\u4fe1"

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/d650;->D:Lv/VText;

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    sget v2, Ll/jbc0;->E6:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p1, v1, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    iget-object p1, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 73
    .line 74
    const-string v1, "jingdong"

    .line 75
    .line 76
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    iget-object p1, p0, Ll/d650;->D:Lv/VText;

    .line 83
    .line 84
    const-string v1, "\u4eac\u4e1c\u652f\u4ed8"

    .line 85
    .line 86
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/d650;->D:Lv/VText;

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sget v2, Ll/jbc0;->D6:I

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {p1, v1, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/d650;->A:Lv/VText;

    .line 107
    .line 108
    iget-object v0, p0, Ll/d650;->J:Ljava/text/DecimalFormat;

    .line 109
    .line 110
    iget-wide v1, p0, Ll/d650;->T:D

    .line 111
    .line 112
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string v0, "\u00a5%s\u7acb\u5373\u8d2d\u4e70"

    .line 121
    .line 122
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method private h0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    const-string v1, "wechat"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v2, "jingdong"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/xl60;->p()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 19
    .line 20
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/xl60;->m()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-static {}, Ll/xl60;->k()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 v0, 0x1

    .line 51
    :goto_0
    if-nez v0, :cond_3

    .line 52
    .line 53
    return-void

    .line 54
    :cond_3
    new-instance v0, Ll/wn60;

    .line 55
    .line 56
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 57
    .line 58
    iget-object v4, p0, Ll/d650;->G:Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    iget-object v5, p0, Ll/d650;->R:Ljava/lang/String;

    .line 61
    .line 62
    const-string v6, ""

    .line 63
    .line 64
    invoke-direct {v0, v3, v4, v5, v6}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Ll/d650;->P:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 68
    .line 69
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Ll/d650;->U:Ll/wn60;

    .line 76
    .line 77
    iget-object v0, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 78
    .line 79
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iget-object v2, p0, Ll/d650;->U:Ll/wn60;

    .line 84
    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    new-instance v0, Ll/s550;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Ll/s550;-><init>(Ll/d650;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 93
    .line 94
    invoke-virtual {v2, v0, p0}, Ll/wn60;->i(Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_4
    iget-object v0, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v3, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 105
    .line 106
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    new-instance v3, Ll/t550;

    .line 111
    .line 112
    invoke-direct {v3, p0}, Ll/t550;-><init>(Ll/d650;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2, v0, v1, v3}, Ll/wn60;->o(Ljava/lang/String;ZLl/y20;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method private m0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x4000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, -0x80000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v0, 0x500

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e650;->b(Ll/d650;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final R(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 12
    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iput-object p1, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 19
    .line 20
    iput-object p2, p0, Ll/d650;->P:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 27
    .line 28
    iget p2, p2, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->value:I

    .line 29
    .line 30
    int-to-double v0, p2

    .line 31
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 32
    .line 33
    div-double/2addr v0, v2

    .line 34
    iput-wide v0, p0, Ll/d650;->T:D

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/d650;->U(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object p2, p0, Ll/d650;->m:Lv/VLinear;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    sget v0, Ll/jbc0;->a5:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    sget v0, Ll/jbc0;->b5:I

    .line 48
    .line 49
    :goto_0
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ll/d650;->n:Lv/VText;

    .line 53
    .line 54
    const-string v0, "#4B1A0A"

    .line 55
    .line 56
    const-string v1, "#66FFDEA2"

    .line 57
    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    move-object v2, v0

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move-object v2, v1

    .line 63
    :goto_1
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Ll/d650;->o:Lv/VText;

    .line 71
    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    move-object v2, v0

    .line 75
    goto :goto_2

    .line 76
    :cond_3
    move-object v2, v1

    .line 77
    :goto_2
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Ll/d650;->p:Lv/VText;

    .line 85
    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    move-object v2, v0

    .line 89
    goto :goto_3

    .line 90
    :cond_4
    move-object v2, v1

    .line 91
    :goto_3
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 96
    .line 97
    .line 98
    iget-object p2, p0, Ll/d650;->q:Lv/VText;

    .line 99
    .line 100
    if-eqz p1, :cond_5

    .line 101
    .line 102
    move-object v2, v0

    .line 103
    goto :goto_4

    .line 104
    :cond_5
    move-object v2, v1

    .line 105
    :goto_4
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Ll/d650;->r:Lv/VText;

    .line 113
    .line 114
    if-eqz p1, :cond_6

    .line 115
    .line 116
    move-object v2, v0

    .line 117
    goto :goto_5

    .line 118
    :cond_6
    move-object v2, v1

    .line 119
    :goto_5
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Ll/d650;->s:Lv/VText;

    .line 127
    .line 128
    const-string v2, "#334B1A0A"

    .line 129
    .line 130
    if-eqz p1, :cond_7

    .line 131
    .line 132
    move-object v3, v2

    .line 133
    goto :goto_6

    .line 134
    :cond_7
    move-object v3, v1

    .line 135
    :goto_6
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 140
    .line 141
    .line 142
    iget-object p2, p0, Ll/d650;->t:Lv/VLinear;

    .line 143
    .line 144
    if-eqz p1, :cond_8

    .line 145
    .line 146
    sget v3, Ll/jbc0;->b5:I

    .line 147
    .line 148
    goto :goto_7

    .line 149
    :cond_8
    sget v3, Ll/jbc0;->a5:I

    .line 150
    .line 151
    :goto_7
    invoke-virtual {p2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 152
    .line 153
    .line 154
    iget-object p2, p0, Ll/d650;->u:Lv/VText;

    .line 155
    .line 156
    if-eqz p1, :cond_9

    .line 157
    .line 158
    move-object v3, v1

    .line 159
    goto :goto_8

    .line 160
    :cond_9
    move-object v3, v0

    .line 161
    :goto_8
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 166
    .line 167
    .line 168
    iget-object p2, p0, Ll/d650;->v:Lv/VText;

    .line 169
    .line 170
    if-eqz p1, :cond_a

    .line 171
    .line 172
    move-object v3, v1

    .line 173
    goto :goto_9

    .line 174
    :cond_a
    move-object v3, v0

    .line 175
    :goto_9
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 180
    .line 181
    .line 182
    iget-object p2, p0, Ll/d650;->w:Lv/VText;

    .line 183
    .line 184
    if-eqz p1, :cond_b

    .line 185
    .line 186
    move-object v3, v1

    .line 187
    goto :goto_a

    .line 188
    :cond_b
    move-object v3, v0

    .line 189
    :goto_a
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    iget-object p2, p0, Ll/d650;->x:Lv/VText;

    .line 197
    .line 198
    if-eqz p1, :cond_c

    .line 199
    .line 200
    move-object v3, v1

    .line 201
    goto :goto_b

    .line 202
    :cond_c
    move-object v3, v0

    .line 203
    :goto_b
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 208
    .line 209
    .line 210
    iget-object p2, p0, Ll/d650;->y:Lv/VText;

    .line 211
    .line 212
    if-eqz p1, :cond_d

    .line 213
    .line 214
    move-object v0, v1

    .line 215
    :cond_d
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 220
    .line 221
    .line 222
    iget-object p2, p0, Ll/d650;->z:Lv/VText;

    .line 223
    .line 224
    if-eqz p1, :cond_e

    .line 225
    .line 226
    goto :goto_c

    .line 227
    :cond_e
    move-object v1, v2

    .line 228
    :goto_c
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 233
    .line 234
    .line 235
    iget-object p1, p0, Ll/d650;->A:Lv/VText;

    .line 236
    .line 237
    iget-object p2, p0, Ll/d650;->J:Ljava/text/DecimalFormat;

    .line 238
    .line 239
    iget-wide v0, p0, Ll/d650;->T:D

    .line 240
    .line 241
    invoke-virtual {p2, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    const-string p2, "\u00a5%s\u7acb\u5373\u8d2d\u4e70"

    .line 250
    .line 251
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method public final U(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 0

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    const/16 p1, 0xc

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic V(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/d650;->I:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public final synthetic W(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d650;->S:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d650;->U(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/d650;->M:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iget-object v0, p0, Ll/d650;->N:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Ll/d650;->R(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 5

    .line 1
    const-string p1, "purchaseShowFrom"

    .line 2
    .line 3
    iget-object v0, p0, Ll/d650;->R:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "productType"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 29
    .line 30
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, "m"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "default_duration"

    .line 45
    .line 46
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v2, p0, Ll/d650;->P:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 51
    .line 52
    invoke-static {v2}, Ll/g2f;->d(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v3, "promotion_type"

    .line 57
    .line 58
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "page_style"

    .line 63
    .line 64
    const-string v4, "promotion"

    .line 65
    .line 66
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    filled-new-array {p1, v0, v1, v2, v3}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v0, "e_purchase_button"

    .line 75
    .line 76
    const-string v1, "p_purchase_page"

    .line 77
    .line 78
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/d650;->Q:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 82
    .line 83
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 84
    .line 85
    invoke-static {}, Ll/pzi0;->o()J

    .line 86
    .line 87
    .line 88
    move-result-wide v2

    .line 89
    long-to-double v2, v2

    .line 90
    sub-double/2addr v0, v2

    .line 91
    const-wide/16 v2, 0x0

    .line 92
    .line 93
    cmpg-double p1, v0, v2

    .line 94
    .line 95
    if-gtz p1, :cond_0

    .line 96
    .line 97
    const-string p0, "\u4f18\u60e0\u5df2\u5931\u6548"

    .line 98
    .line 99
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_0
    invoke-direct {p0}, Ll/d650;->h0()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic b0(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/bo60;

    .line 2
    .line 3
    iget-object v0, p0, Ll/d650;->G:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    invoke-direct {p1, v0, v1}, Ll/bo60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/bo60;->r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p1, v0}, Ll/bo60;->l(Z)Ll/bo60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/r550;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/r550;-><init>(Ll/d650;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ll/bo60;->q(Ll/y20;)Ll/bo60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/bo60;->s()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic c0(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d650;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d0(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/d650;->Q:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-double v0, v0

    .line 10
    sub-double/2addr p0, v0

    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    cmpg-double p0, p0, v0

    .line 14
    .line 15
    if-gtz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/d650;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic e0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d650;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d650;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i0()V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u5f00\u901a\u524d\u8bf7\u9605\u8bfb"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "\u300a\u4f1a\u5458\u670d\u52a1\u534f\u8bae\u300b"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "\u4f1a\u5458\u670d\u52a1\u534f\u8bae"

    .line 18
    .line 19
    filled-new-array {v2}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, "#CCFFDEA2"

    .line 28
    .line 29
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const/4 v6, 0x3

    .line 34
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-static {v1, v3, v5, v6}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    new-instance v2, Ll/da5;

    .line 47
    .line 48
    sget-object v3, Ll/bn60;->c:Ljava/lang/String;

    .line 49
    .line 50
    invoke-direct {v2, v3}, Ll/da5;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v2, v3}, Ll/da5;->b(I)Ll/da5;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 62
    .line 63
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->D6:I

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v2, v3}, Ll/da5;->c(Ljava/lang/String;)Ll/da5;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-virtual {v2, v3}, Ll/da5;->d(Z)Ll/da5;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    add-int/lit8 v3, v0, 0x6

    .line 79
    .line 80
    const/16 v4, 0x12

    .line 81
    .line 82
    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/d650;->E:Lv/VText;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Ll/d650;->E:Lv/VText;

    .line 91
    .line 92
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final j0()V
    .locals 7

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/d650;->Q:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 6
    .line 7
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 8
    .line 9
    long-to-double v0, v0

    .line 10
    sub-double/2addr v2, v0

    .line 11
    double-to-long v0, v2

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v2, v0, v2

    .line 15
    .line 16
    if-gtz v2, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/d650;->B:Lv/VText;

    .line 19
    .line 20
    const-string v0, "\u4f18\u60e0\u5df2\u7ed3\u675f"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-wide/32 v2, 0x5265c00

    .line 27
    .line 28
    .line 29
    cmp-long v4, v0, v2

    .line 30
    .line 31
    iget-object p0, p0, Ll/d650;->B:Lv/VText;

    .line 32
    .line 33
    if-lez v4, :cond_1

    .line 34
    .line 35
    div-long/2addr v0, v2

    .line 36
    long-to-int v0, v0

    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "\u4f18\u60e0\u5012\u8ba1\u65f6\uff1a %d\u5929\u540e\u5931\u6548"

    .line 46
    .line 47
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-wide/32 v2, 0x36ee80

    .line 56
    .line 57
    .line 58
    div-long v4, v0, v2

    .line 59
    .line 60
    long-to-int v4, v4

    .line 61
    rem-long v2, v0, v2

    .line 62
    .line 63
    const-wide/32 v5, 0xea60

    .line 64
    .line 65
    .line 66
    div-long/2addr v2, v5

    .line 67
    long-to-int v2, v2

    .line 68
    rem-long/2addr v0, v5

    .line 69
    long-to-int v0, v0

    .line 70
    div-int/lit16 v0, v0, 0x3e8

    .line 71
    .line 72
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    filled-new-array {v1, v2, v0}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v1, "\u4f18\u60e0\u5012\u8ba1\u65f6\uff1a %02d:%02d:%02d\u540e\u5931\u6548"

    .line 89
    .line 90
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final k0()V
    .locals 15

    .line 1
    iget-object v0, p0, Ll/d650;->o:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/d650;->q:Lv/VText;

    .line 13
    .line 14
    const-string v2, "12\u4e2a\u6708"

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/text/SpannableString;

    .line 20
    .line 21
    iget-object v2, p0, Ll/d650;->J:Ljava/text/DecimalFormat;

    .line 22
    .line 23
    iget-object v4, p0, Ll/d650;->L:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 24
    .line 25
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 26
    .line 27
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 28
    .line 29
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 30
    .line 31
    iget v4, v4, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->value:I

    .line 32
    .line 33
    int-to-double v4, v4

    .line 34
    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    .line 35
    .line 36
    div-double/2addr v4, v6

    .line 37
    invoke-virtual {v2, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string v4, "\u00a5%s"

    .line 46
    .line 47
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-direct {v0, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    new-instance v2, Landroid/text/style/RelativeSizeSpan;

    .line 55
    .line 56
    const/high16 v5, 0x3f100000    # 0.5625f

    .line 57
    .line 58
    invoke-direct {v2, v5}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 59
    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    const/16 v8, 0x21

    .line 63
    .line 64
    invoke-virtual {v0, v2, v5, v3, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 65
    .line 66
    .line 67
    iget-object v9, p0, Ll/d650;->r:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/d650;->r:Lv/VText;

    .line 73
    .line 74
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    invoke-virtual {v0, v9, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/d650;->s:Lv/VText;

    .line 82
    .line 83
    iget-object v9, p0, Ll/d650;->J:Ljava/text/DecimalFormat;

    .line 84
    .line 85
    iget-object v10, p0, Ll/d650;->K:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 86
    .line 87
    iget-object v11, v10, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 88
    .line 89
    iget-object v11, v11, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 90
    .line 91
    iget-wide v11, v11, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 92
    .line 93
    iget v10, v10, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 94
    .line 95
    int-to-double v13, v10

    .line 96
    mul-double/2addr v11, v13

    .line 97
    invoke-virtual {v9, v11, v12}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v9

    .line 105
    const-string v10, "\u539f\u4ef7\u00a5%s"

    .line 106
    .line 107
    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/d650;->s:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const/16 v9, 0x11

    .line 121
    .line 122
    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setFlags(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/d650;->v:Lv/VText;

    .line 126
    .line 127
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 128
    .line 129
    .line 130
    move-result-object v11

    .line 131
    invoke-virtual {v0, v11, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/d650;->x:Lv/VText;

    .line 135
    .line 136
    const-string v11, "3\u4e2a\u6708"

    .line 137
    .line 138
    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/d650;->y:Lv/VText;

    .line 142
    .line 143
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 144
    .line 145
    .line 146
    move-result-object v11

    .line 147
    invoke-virtual {v0, v11, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 148
    .line 149
    .line 150
    new-instance v0, Landroid/text/SpannableString;

    .line 151
    .line 152
    iget-object v11, p0, Ll/d650;->J:Ljava/text/DecimalFormat;

    .line 153
    .line 154
    iget-object v12, p0, Ll/d650;->N:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 155
    .line 156
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 157
    .line 158
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 159
    .line 160
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 161
    .line 162
    iget v12, v12, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->value:I

    .line 163
    .line 164
    int-to-double v12, v12

    .line 165
    div-double/2addr v12, v6

    .line 166
    invoke-virtual {v11, v12, v13}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v6

    .line 170
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-direct {v0, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v2, v5, v3, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 182
    .line 183
    .line 184
    iget-object v2, p0, Ll/d650;->y:Lv/VText;

    .line 185
    .line 186
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ll/d650;->z:Lv/VText;

    .line 190
    .line 191
    iget-object v2, p0, Ll/d650;->J:Ljava/text/DecimalFormat;

    .line 192
    .line 193
    iget-object v4, p0, Ll/d650;->M:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 194
    .line 195
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 196
    .line 197
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 198
    .line 199
    iget-wide v5, v5, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 200
    .line 201
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 202
    .line 203
    int-to-double v7, v4

    .line 204
    mul-double/2addr v5, v7

    .line 205
    invoke-virtual {v2, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-static {v10, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Ll/d650;->z:Lv/VText;

    .line 221
    .line 222
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setFlags(I)V

    .line 227
    .line 228
    .line 229
    iget-object p0, p0, Ll/d650;->A:Lv/VText;

    .line 230
    .line 231
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p0, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, "alipay"

    .line 6
    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Ll/d650;->H:Lcom/p1/mobile/putong/data/PayMethod;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/d650;->g0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/g1e;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/d650;->Q:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-wide/16 v0, 0x1

    .line 13
    .line 14
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/psd0;->y()Lrx/c$d;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/g1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/a650;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/a650;-><init>(Ll/d650;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/b650;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/b650;-><init>(Ll/d650;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/d650;->G:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/d650;->Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/d650;->F:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/d650;->m0()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ll/d650;->T()V

    .line 24
    .line 25
    .line 26
    const-string p1, "alipay"

    .line 27
    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/d650;->l0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public show()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "p_purchase_page"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/d650;->S:Ll/l4g0;

    .line 19
    .line 20
    const-string v1, "purchaseShowFrom"

    .line 21
    .line 22
    iget-object v2, p0, Ll/d650;->R:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v3, "productType"

    .line 37
    .line 38
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Ll/d650;->O:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 48
    .line 49
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v4, "m"

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const-string v4, "default_duration"

    .line 64
    .line 65
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iget-object v4, p0, Ll/d650;->P:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 70
    .line 71
    invoke-static {v4}, Ll/g2f;->d(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const-string v5, "promotion_type"

    .line 76
    .line 77
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    const-string v5, "page_style"

    .line 82
    .line 83
    const-string v6, "promotion"

    .line 84
    .line 85
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    filled-new-array {v1, v2, v3, v4, v5}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Ll/d650;->S:Ll/l4g0;

    .line 97
    .line 98
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x1

    .line 102
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method
