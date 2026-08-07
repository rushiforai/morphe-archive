.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VLinear;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Ll/ofp;

.field public h:Lcom/p1/mobile/putong/app/PutongFrag;

.field public i:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:I

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->k:Ljava/lang/String;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->l:I

    .line 11
    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j:Ljava/lang/String;

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->k:Ljava/lang/String;

    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->l:I

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j:Ljava/lang/String;

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->k:Ljava/lang/String;

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->l:I

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->o(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->s(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/User;)Landroid/util/Pair;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->q(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->p(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->r(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method private getSubtypeByPurchaseType()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard$a;->a:[I

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    aget p0, v1, p0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq p0, v1, :cond_4

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq p0, v1, :cond_3

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    if-eq p0, v1, :cond_2

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-eq p0, v1, :cond_1

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    const-string p0, "ultraPremium"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    const-string p0, "premium"

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    const-string p0, "see"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_4
    const-string p0, "vip"

    .line 39
    .line 40
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->t(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sget v3, Ll/dbc0;->Uc:I

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget v2, Ll/dbc0;->Nc:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->w()V

    .line 42
    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g:Ll/ofp;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 53
    .line 54
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/oyo;

    .line 67
    .line 68
    invoke-direct {v1}, Ll/oyo;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/vyo;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/vyo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->getSubtypeByPurchaseType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final C(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "subtype"

    .line 19
    .line 20
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    const-string v0, "subscription_status"

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "e_ttc_renew_membership_click"

    .line 35
    .line 36
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public final D()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g:Ll/ofp;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/bzo;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/bzo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public final E(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p2, Landroid/text/SpannableStringBuilder;

    .line 7
    .line 8
    invoke-direct {p2}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 20
    .line 21
    .line 22
    :cond_1
    if-eqz p3, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    const/high16 p3, 0x41400000    # 12.0f

    .line 35
    .line 36
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p1, v0, v0, p3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 42
    .line 43
    .line 44
    new-instance p3, Landroid/text/style/ImageSpan;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-direct {p3, p1, v0}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 48
    .line 49
    .line 50
    const-string p1, " "

    .line 51
    .line 52
    invoke-virtual {p2, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    sub-int/2addr p1, v0

    .line 60
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/16 v1, 0x21

    .line 65
    .line 66
    invoke-virtual {p2, p3, p1, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dzo;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->n()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const-string v1, ""

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    const/4 v3, 0x0

    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    .line 33
    invoke-static {v0}, Ll/bpc0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 38
    .line 39
    invoke-static {v4}, Ll/bpc0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    if-nez v4, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/omp;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Mc:I

    .line 66
    .line 67
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-nez v5, :cond_2

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    move v2, v3

    .line 83
    :goto_0
    invoke-virtual {p0, v4, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->E(Ljava/lang/String;Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Tc:I

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0, v1, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->E(Ljava/lang/String;Ljava/lang/String;I)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 114
    .line 115
    invoke-static {v0, v4}, Ll/omp;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 120
    .line 121
    invoke-static {v4}, Ll/bpc0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 126
    .line 127
    invoke-static {v5}, Ll/bpc0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    if-nez v5, :cond_5

    .line 132
    .line 133
    if-eqz v4, :cond_6

    .line 134
    .line 135
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 136
    .line 137
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Nc:I

    .line 142
    .line 143
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 148
    .line 149
    if-eqz v1, :cond_7

    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    if-nez v5, :cond_7

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_7
    move v2, v3

    .line 159
    :goto_1
    invoke-virtual {p0, v4, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->E(Ljava/lang/String;Ljava/lang/String;I)V

    .line 164
    .line 165
    .line 166
    :cond_8
    :goto_2
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_3

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    aget p1, p2, p1

    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    if-eq p1, p2, :cond_2

    .line 17
    .line 18
    const/4 p2, 0x2

    .line 19
    if-eq p1, p2, :cond_2

    .line 20
    .line 21
    const/4 p2, 0x3

    .line 22
    if-eq p1, p2, :cond_2

    .line 23
    .line 24
    const/4 p2, 0x4

    .line 25
    if-eq p1, p2, :cond_1

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    sget p0, Ll/dbc0;->Ja:I

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    sget p0, Ll/dbc0;->Ea:I

    .line 32
    .line 33
    :cond_3
    :goto_0
    return p0
.end method

.method public final l()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_6

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    invoke-static {v0}, Ll/bpc0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    invoke-static {v1}, Ll/bpc0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const-string v2, "expired"

    .line 36
    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->getSubtypeByPurchaseType()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->n()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    const-string v1, "active_non_renewal"

    .line 52
    .line 53
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Ll/yap;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    const-string v1, "active"

    .line 71
    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Ll/bpc0;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->n()Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eqz v3, :cond_4

    .line 87
    .line 88
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_4
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 96
    .line 97
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 98
    .line 99
    if-eqz v2, :cond_5

    .line 100
    .line 101
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->T4()V

    .line 104
    .line 105
    .line 106
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->n()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_6

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->B(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_6
    :goto_2
    return-void
.end method

.method public m(Ll/ofp;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g:Ll/ofp;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->k:Ljava/lang/String;

    .line 14
    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->l:I

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->D()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final n()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    aget v0, v1, v0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_4

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    if-eq v0, v2, :cond_3

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    if-eq v0, v2, :cond_2

    .line 23
    .line 24
    const/4 v2, 0x4

    .line 25
    if-eq v0, v2, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    invoke-static {p0}, Ll/joa;->b4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    :goto_0
    xor-int/2addr p0, v1

    .line 34
    return p0

    .line 35
    :cond_1
    invoke-static {}, Ll/joa;->k4()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-static {}, Ll/joa;->f4()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    goto :goto_0

    .line 45
    :cond_3
    invoke-static {}, Ll/joa;->i4()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    goto :goto_0

    .line 50
    :cond_4
    invoke-static {}, Ll/joa;->n4()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    goto :goto_0
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->e:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->k:Ljava/lang/String;

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->l:I

    .line 16
    .line 17
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->d:Lv/VLinear;

    .line 10
    .line 11
    invoke-static {}, Ll/d79;->V()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isUltraPremium()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 27
    :goto_1
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 37
    .line 38
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic q(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->d:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {}, Ll/d79;->T()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 23
    :goto_1
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/upl0;->b(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 8
    .line 9
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->d:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {}, Ll/d79;->T()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 19
    :goto_1
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Ll/upl0;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_3

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->z()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->x()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->y()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->A()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final w()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g:Ll/ofp;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/xyo;

    .line 14
    .line 15
    invoke-direct {v3}, Ll/xyo;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/zyo;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/zyo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final x()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 8
    .line 9
    sget v2, Ll/qa00;->d:I

    .line 10
    .line 11
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 15
    .line 16
    sget v2, Ll/qa00;->i:I

    .line 17
    .line 18
    invoke-static {v0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->a:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    const/high16 v2, 0x41880000    # 17.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget v3, Ll/dbc0;->Wa:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    sget v2, Lcom/p1/mobile/putong/core/R$string;->hh:I

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v2, Ll/dbc0;->n9:I

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->w()V

    .line 68
    .line 69
    .line 70
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 71
    .line 72
    if-nez v0, :cond_0

    .line 73
    .line 74
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g:Ll/ofp;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 79
    .line 80
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 81
    .line 82
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 83
    .line 84
    const-string v3, "svip"

    .line 85
    .line 86
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/pyo;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/pyo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    :cond_0
    return-void
.end method

.method public final y()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/dbc0;->Qb:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/z99;->g3()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->c:Landroid/widget/TextView;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Kc:I

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Mn:I

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->w()V

    .line 38
    .line 39
    .line 40
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g:Ll/ofp;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 50
    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 64
    .line 65
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    new-instance v4, Ll/ryo;

    .line 74
    .line 75
    invoke-direct {v4}, Ll/ryo;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v2, v3, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/tyo;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/tyo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method public final z()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 8
    .line 9
    sget v2, Ll/qa00;->d:I

    .line 10
    .line 11
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 15
    .line 16
    sget v2, Ll/qa00;->i:I

    .line 17
    .line 18
    invoke-static {v0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->a:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    const/high16 v2, 0x41880000    # 17.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->b:Lv/VImage;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget v3, Ll/dbc0;->jb:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    sget v2, Lcom/p1/mobile/putong/core/R$string;->hg:I

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->c:Landroid/widget/TextView;

    .line 55
    .line 56
    const-string v2, "#FFDEF4"

    .line 57
    .line 58
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->f:Lv/VText;

    .line 66
    .line 67
    const-string v2, "#80FFFFFF"

    .line 68
    .line 69
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v2, Ll/dbc0;->Mc:I

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->w()V

    .line 90
    .line 91
    .line 92
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 93
    .line 94
    if-nez v0, :cond_0

    .line 95
    .line 96
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->m:Z

    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g:Ll/ofp;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->h:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 101
    .line 102
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 105
    .line 106
    const-string v3, "ultraPremium"

    .line 107
    .line 108
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/nyo;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/nyo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    :cond_0
    return-void
.end method
