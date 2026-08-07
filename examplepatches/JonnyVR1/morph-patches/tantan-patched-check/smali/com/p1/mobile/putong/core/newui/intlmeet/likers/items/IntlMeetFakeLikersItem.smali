.class public Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;
.super Lv/VFrame_Shadow;
.source "SourceFile"


# instance fields
.field public h:Lv/VDraweeView;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Landroid/widget/FrameLayout;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lv/VText_NoTopPadding;

.field public o:Lv/VText_NoTopPadding;

.field public p:Lv/VImage;

.field public q:Landroid/view/View;

.field public r:Landroid/widget/LinearLayout;

.field public s:Lv/VImage;

.field public t:Landroid/widget/TextView;

.field public u:Landroid/view/View;

.field public v:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;Ll/svl;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->j(Ll/svl;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getUser()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/neo;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j(Ll/svl;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Ll/oeo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->p(Ll/oeo;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->q(Ll/oeo;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->o()V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/z99;->h3()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->r(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->s(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/yio;->b(Lcom/p1/mobile/putong/data/User;)Ll/yio$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->t:Landroid/widget/TextView;

    .line 6
    .line 7
    iget-object v1, p1, Ll/yio$a;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget v0, p1, Ll/yio$a;->b:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->s:Lv/VImage;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->s:Lv/VImage;

    .line 23
    .line 24
    iget p1, p1, Ll/yio$a;->b:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->m:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->n:Lv/VText_NoTopPadding;

    .line 8
    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->o:Lv/VText_NoTopPadding;

    .line 15
    .line 16
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->o:Lv/VText_NoTopPadding;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 30
    .line 31
    invoke-virtual {v2, p2}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    xor-int/2addr v1, v2

    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 40
    .line 41
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->p:Lv/VImage;

    .line 44
    .line 45
    invoke-interface {v0, p1, p2, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->n:Lv/VText_NoTopPadding;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance p2, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;

    .line 55
    .line 56
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem$a;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->i:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 10
    .line 11
    iget-object v0, v0, Ll/l99;->X:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 22
    .line 23
    iget-object v0, v0, Ll/l99;->X:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;

    .line 40
    .line 41
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->i:Lv/VLinear;

    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->j:Lv/VText;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->j:Lv/VText;

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 69
    .line 70
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->g0:I

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget v1, v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->count:I

    .line 77
    .line 78
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_1

    .line 98
    .line 99
    sget p1, Ll/gbc0;->U:I

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    sget p1, Ll/gbc0;->T:I

    .line 103
    .line 104
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->k:Lv/VImage;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 107
    .line 108
    .line 109
    :cond_2
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;Ll/svl;)V
    .locals 7

    return-void

    .line 1
    instance-of v0, p2, Ll/oeo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    move-object v0, p2

    .line 7
    check-cast v0, Ll/oeo;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/oeo;->a()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->m(Lcom/p1/mobile/putong/data/User;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->m:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->t:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 64
    .line 65
    iget v3, v3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 66
    .line 67
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->mi(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ed()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v2, 0x1

    .line 87
    const/4 v3, 0x4

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 91
    .line 92
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->h:Lv/VDraweeView;

    .line 93
    .line 94
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    const/16 v6, 0xa

    .line 109
    .line 110
    invoke-virtual {v0, v4, v5, v3, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->u:Landroid/view/View;

    .line 114
    .line 115
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->r:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->u:Landroid/view/View;

    .line 125
    .line 126
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->r:Landroid/widget/LinearLayout;

    .line 130
    .line 131
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->h:Lv/VDraweeView;

    .line 137
    .line 138
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->v:Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    const/16 v4, 0x14

    .line 153
    .line 154
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 155
    .line 156
    .line 157
    :goto_1
    new-instance v0, Ll/meo;

    .line 158
    .line 159
    invoke-direct {v0, p0, p2, p1}, Ll/meo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;Ll/svl;Lcom/p1/mobile/android/app/Act;)V

    .line 160
    .line 161
    .line 162
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public final o()V
    .locals 0

    .line 1
    const-string p0, "see_feed"

    .line 2
    .line 3
    invoke-static {p0}, Ll/yho;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Ll/oeo;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/oeo;->a()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Ll/yio;->a(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string v0, "superlike_tag"

    .line 29
    .line 30
    :cond_0
    invoke-virtual {p1}, Ll/oeo;->a()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/yio;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v0, p0}, Ll/yho;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-static {v0, v0}, Ll/yho;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final q(Ll/oeo;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/oeo;->a()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Ll/yio;->a(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const-string v1, "superlike_tag"

    .line 30
    .line 31
    :cond_0
    invoke-virtual {p1}, Ll/oeo;->a()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Ll/yio;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1}, Ll/oeo;->a()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v0, v1, p0}, Ll/yho;->p(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-virtual {p1}, Ll/oeo;->a()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p0, v0, v1, v1}, Ll/yho;->p(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final r(Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    const-string v2, "p_intl_meet_view,e_intl_meet_see_users,click"

    .line 20
    .line 21
    move-object v1, p1

    .line 22
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final s(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    const-string v1, "p_intl_meet_view,e_intl_meet_see_users,click"

    .line 17
    .line 18
    invoke-interface {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->showSeeDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
