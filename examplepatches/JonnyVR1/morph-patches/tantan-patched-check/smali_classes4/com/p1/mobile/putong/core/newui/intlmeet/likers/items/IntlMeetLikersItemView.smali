.class public Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public j:Lv/VLinear_FillerMeasure;

.field public k:Lv/VText_NoTopPadding;

.field public l:Lv/VText_NoTopPadding;

.field public m:Lv/VImage;

.field public n:Lv/VLinear_FillerMeasure;

.field public o:Lv/VText_NoTopPadding;

.field public p:Lv/VText_NoTopPadding;

.field public q:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->i(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/data/Location;)Lcom/p1/mobile/putong/data/Location;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->clone()Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideInfo()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideRegionCity()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 19
    .line 20
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->isHideRegionDistrict()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 30
    .line 31
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 32
    .line 33
    :cond_1
    return-object v0
.end method

.method public static g(Lcom/p1/mobile/putong/data/Region;Lcom/p1/mobile/putong/data/Region;)Ljava/lang/CharSequence;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move v0, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v0, v1

    .line 24
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    move v3, v2

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    move v3, v1

    .line 45
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_2

    .line 52
    .line 53
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v5, p1, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-nez v4, :cond_2

    .line 62
    .line 63
    move v1, v2

    .line 64
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    const/4 v4, 0x0

    .line 71
    if-nez v2, :cond_3

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Region;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    return-object v4

    .line 80
    :cond_3
    if-eqz v0, :cond_4

    .line 81
    .line 82
    if-eqz v3, :cond_4

    .line 83
    .line 84
    const-string p0, ""

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_4
    if-nez v3, :cond_5

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_6
    return-object v4
.end method

.method public static h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 23
    .line 24
    return-object p0
.end method

.method public static j(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->f(Lcom/p1/mobile/putong/data/Location;)Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 8
    .line 9
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->g(Lcom/p1/mobile/putong/data/Region;Lcom/p1/mobile/putong/data/Region;)Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static k(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->q(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 36
    .line 37
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 42
    .line 43
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->S0:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 53
    .line 54
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->j(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Location;->clone()Lcom/p1/mobile/putong/data/Location;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-static {p0, v0, v0}, Ll/q8g0;->r(Lcom/p1/mobile/putong/data/Location;ZZ)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/common/R$string;->K1:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static q(Lcom/p1/mobile/putong/data/User;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->l()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    return v2

    .line 19
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 28
    .line 29
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 30
    .line 31
    invoke-interface {v0, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Dn(Lcom/p1/mobile/putong/data/QualificationType;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    return v1

    .line 50
    :cond_2
    return v2
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ygo;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic i(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p0, p2, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public l(Ll/cio;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/cio;->a()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    new-instance p1, Ll/vgo;

    .line 8
    .line 9
    invoke-direct {p1, p0, p2}, Ll/vgo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->n(Lcom/p1/mobile/putong/data/User;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->f:Lv/VImage;

    .line 21
    .line 22
    const/4 p2, 0x4

    .line 23
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->e:Lv/VImage;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->p(Lcom/p1/mobile/putong/data/User;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->g:Lv/VImage;

    .line 55
    .line 56
    const/4 p2, 0x0

    .line 57
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->h:Lv/VImage;

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->g:Lv/VImage;

    .line 66
    .line 67
    new-instance p2, Ll/wgo;

    .line 68
    .line 69
    invoke-direct {p2, p3}, Ll/wgo;-><init>(Ll/x20;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->h:Lv/VImage;

    .line 76
    .line 77
    new-instance p1, Ll/xgo;

    .line 78
    .line 79
    invoke-direct {p1, p4}, Ll/xgo;-><init>(Ll/x20;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    :cond_0
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v0, v1, v2, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 26
    .line 27
    .line 28
    sget v1, Ll/qa00;->h:I

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->a:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/wlj;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->a:Lv/VDraweeView;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v1, -0x1

    .line 52
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->a:Lv/VDraweeView;

    .line 55
    .line 56
    invoke-static {v0, v3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->k:Lv/VText_NoTopPadding;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->l:Lv/VText_NoTopPadding;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->l:Lv/VText_NoTopPadding;

    .line 78
    .line 79
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 82
    .line 83
    invoke-virtual {v1, p1}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const/4 v2, 0x1

    .line 88
    xor-int/2addr v1, v2

    .line 89
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 93
    .line 94
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->q:Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->m:Lv/VImage;

    .line 103
    .line 104
    invoke-interface {v0, v1, v4, v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_0

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o(Lcom/p1/mobile/putong/data/User;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->n:Lv/VLinear_FillerMeasure;

    .line 142
    .line 143
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o:Lv/VText_NoTopPadding;

    .line 147
    .line 148
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 149
    .line 150
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->m(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->p:Lv/VText_NoTopPadding;

    .line 158
    .line 159
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    if-eqz v4, :cond_1

    .line 164
    .line 165
    const-string v4, ""

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o:Lv/VText_NoTopPadding;

    .line 169
    .line 170
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    if-eqz v4, :cond_2

    .line 175
    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    sget v5, Lcom/p1/mobile/putong/core/member/R$string;->Z0:I

    .line 181
    .line 182
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    goto :goto_0

    .line 191
    :cond_2
    move-object v4, v1

    .line 192
    :goto_0
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o:Lv/VText_NoTopPadding;

    .line 196
    .line 197
    xor-int/lit8 v4, v0, 0x1

    .line 198
    .line 199
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->n:Lv/VLinear_FillerMeasure;

    .line 203
    .line 204
    if-eqz v0, :cond_3

    .line 205
    .line 206
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    if-nez p1, :cond_4

    .line 211
    .line 212
    :cond_3
    move v3, v2

    .line 213
    :cond_4
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/yio;->b(Lcom/p1/mobile/putong/data/User;)Ll/yio$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget v0, p1, Ll/yio$a;->b:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o:Lv/VText_NoTopPadding;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1, v0, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o:Lv/VText_NoTopPadding;

    .line 16
    .line 17
    sget v1, Ll/qa00;->e:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v1, v2, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o:Lv/VText_NoTopPadding;

    .line 27
    .line 28
    iget-object p1, p1, Ll/yio$a;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->o:Lv/VText_NoTopPadding;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->p:Lv/VText_NoTopPadding;

    .line 40
    .line 41
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->n:Lv/VLinear_FillerMeasure;

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->b:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ic()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 24
    .line 25
    iget-object v0, v0, Ll/l99;->X:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 36
    .line 37
    iget-object v0, v0, Ll/l99;->X:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;

    .line 54
    .line 55
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->id:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->b:Lv/VLinear;

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->c:Lv/VText;

    .line 72
    .line 73
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->c:Lv/VText;

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 83
    .line 84
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->g0:I

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget v1, v1, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->count:I

    .line 91
    .line 92
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_1

    .line 112
    .line 113
    sget p1, Ll/gbc0;->U:I

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    sget p1, Ll/gbc0;->T:I

    .line 117
    .line 118
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->d:Lv/VImage;

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 121
    .line 122
    .line 123
    :cond_2
    return-void
.end method
