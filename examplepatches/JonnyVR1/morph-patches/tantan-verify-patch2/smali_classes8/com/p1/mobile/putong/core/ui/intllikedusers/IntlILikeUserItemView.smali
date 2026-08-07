.class public Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/AutoVDraweeView;

.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Lv/VText_NoTopPadding;

.field public e:Lv/VText_NoTopPadding;

.field public f:Lv/VImage;

.field public g:Lv/VText_NoTopPadding;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lcom/p1/mobile/putong/core/data/LikeUser;

.field public final k:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->k:Ljava/util/Set;

    .line 10
    .line 11
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

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->k:Ljava/util/Set;

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->k:Ljava/util/Set;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->j(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->h(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->i(Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ern;->a(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Landroid/view/View;)V

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
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method public final f(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->z4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Ll/gbc0;->G:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne p1, v2, :cond_1

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget p1, Ll/gbc0;->d0:I

    .line 13
    .line 14
    sget v1, Ll/gbc0;->e0:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget p1, Ll/gbc0;->C:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const p1, 0x106000d

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->a:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final g(JZ)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    const-wide/16 p0, 0x3e8

    .line 7
    .line 8
    div-long/2addr v0, p0

    .line 9
    const-wide/16 p0, 0x0

    .line 10
    .line 11
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    const-wide/32 p2, 0x3f480

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-wide/32 p2, 0x15180

    .line 22
    .line 23
    .line 24
    :goto_0
    sub-long/2addr p2, v0

    .line 25
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide p0

    .line 29
    const-wide/16 p2, 0xe0f

    .line 30
    .line 31
    add-long/2addr p0, p2

    .line 32
    const-wide/16 p2, 0xe10

    .line 33
    .line 34
    div-long/2addr p0, p2

    .line 35
    const-wide/16 p2, 0x1

    .line 36
    .line 37
    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide p0

    .line 41
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 42
    .line 43
    sget p3, Lcom/p1/mobile/putong/core/member/R$string;->U:I

    .line 44
    .line 45
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public final synthetic h(Ll/y20;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p2, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->j:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 21
    .line 22
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic i(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->e()Lcom/p1/mobile/android/app/Act;

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
    if-eq p0, p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic j(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->e()Lcom/p1/mobile/android/app/Act;

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
    if-eq p0, p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/y20;Ll/y20;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->j:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 2
    .line 3
    new-instance v0, Ll/brn;

    .line 4
    .line 5
    invoke-direct {v0, p0, p3}, Ll/brn;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ll/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->i:Lv/VImage;

    .line 12
    .line 13
    new-instance v0, Ll/crn;

    .line 14
    .line 15
    invoke-direct {v0, p0, p4}, Ll/crn;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->h:Lv/VImage;

    .line 22
    .line 23
    new-instance p4, Ll/drn;

    .line 24
    .line 25
    invoke-direct {p4, p0, p5}, Ll/drn;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p3, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->b:Lv/AutoVDraweeView;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object p4

    .line 41
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    invoke-virtual {p3, p4}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 49
    .line 50
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    const/4 p4, 0x1

    .line 59
    if-eqz p3, :cond_1

    .line 60
    .line 61
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->k:Ljava/util/Set;

    .line 62
    .line 63
    iget-object p5, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-interface {p3, p5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    if-nez p3, :cond_0

    .line 70
    .line 71
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->k:Ljava/util/Set;

    .line 72
    .line 73
    iget-object p5, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    invoke-interface {p3, p5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    const-string p5, "e_intl_instantmatch_btn"

    .line 87
    .line 88
    invoke-static {p5, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->h:Lv/VImage;

    .line 92
    .line 93
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->d:Lv/VText_NoTopPadding;

    .line 97
    .line 98
    iget-object p5, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {p3, p5}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->e:Lv/VText_NoTopPadding;

    .line 104
    .line 105
    iget-object p5, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 106
    .line 107
    invoke-static {p5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p5

    .line 111
    invoke-static {p3, p5}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->f:Lv/VImage;

    .line 115
    .line 116
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p3

    .line 120
    if-eqz p3, :cond_2

    .line 121
    .line 122
    sget-object p3, Ll/uqb0;->b0:Ll/sre0;

    .line 123
    .line 124
    iget-object p3, p3, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    .line 129
    move-result-object p5

    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->f:Lv/VImage;

    .line 131
    .line 132
    invoke-interface {p3, p5, p2, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 133
    .line 134
    .line 135
    :cond_2
    invoke-static {}, Ll/joa;->f4()Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    xor-int/2addr p2, p4

    .line 140
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->g:Lv/VText_NoTopPadding;

    .line 141
    .line 142
    iget-wide p4, p1, Lcom/p1/mobile/putong/core/data/LikeUser;->createTime:J

    .line 143
    .line 144
    invoke-virtual {p0, p4, p5, p2}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->g(JZ)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {p3, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->i:Lv/VImage;

    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mb()Z

    .line 162
    .line 163
    .line 164
    move-result p2

    .line 165
    if-eqz p2, :cond_3

    .line 166
    .line 167
    sget p2, Ll/gbc0;->y:I

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    if-eqz p2, :cond_4

    .line 175
    .line 176
    sget p2, Ll/gbc0;->t0:I

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_4
    sget p2, Ll/gbc0;->s0:I

    .line 180
    .line 181
    :goto_0
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, p6}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->f(I)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-double v0, v0

    .line 6
    const-wide v2, 0x3ff547ae147ae148L    # 1.33

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    mul-double/2addr v0, v2

    .line 12
    double-to-int v0, v0

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
