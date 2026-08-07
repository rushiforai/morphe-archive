.class public Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/android/app/Act;

.field public l:Lcom/p1/mobile/putong/data/User;

.field public m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public n:I

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->n:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->o:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->n:I

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->n:I

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->o:Z

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->B2:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c8n;->a(Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->V()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final V()V
    .locals 1

    .line 1
    const-string p0, "e_intl_card_sayhi"

    .line 2
    .line 3
    const-string v0, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->l:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->l:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->o:Z

    .line 23
    .line 24
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->k:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->l:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 29
    .line 30
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->n:I

    .line 31
    .line 32
    sget-object p1, Ll/qap;->Companion:Ll/qap$a;

    .line 33
    .line 34
    invoke-virtual {p1, p3, p2}, Ll/qap$a;->n(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRenderUser()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_2

    .line 49
    .line 50
    :cond_1
    iget-object p2, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ll/qap$a;->j(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_3

    .line 57
    .line 58
    :cond_2
    iget-object p2, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Ll/qap$a;->r(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->b0()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->Z()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->c:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 71
    .line 72
    const/4 p2, 0x0

    .line 73
    invoke-virtual {p1, p2}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->d:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->i:Lv/VLinear;

    .line 87
    .line 88
    invoke-virtual {p0, p2}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    new-instance v1, Ll/z7n;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/z7n;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->i:Lv/VLinear;

    .line 12
    .line 13
    new-instance v1, Ll/a8n;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/a8n;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->d:Lv/VText;

    .line 22
    .line 23
    new-instance v1, Ll/b8n;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/b8n;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final a0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O5()V

    .line 6
    .line 7
    .line 8
    const-string v0, "e_intl_card_sayhi"

    .line 9
    .line 10
    const-string v1, "p_suggest_users_home_view"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/joa;->f4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I2:Lrx/subjects/a;

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->k:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    const-string v1, "p_suggest_users_home_view,e_intl_card_sayhi,click"

    .line 49
    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 51
    .line 52
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final b0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->n:I

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->o:Z

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->V()V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->S(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->d:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->h:Lv/VText;

    .line 19
    .line 20
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->j:Lv/VText;

    .line 28
    .line 29
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->d:Lv/VText;

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    xor-int/2addr v1, v3

    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->e:Lv/VLinear;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
