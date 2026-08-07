.class public Ll/qv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/kv;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VRelative;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VImage;

.field public n:Lv/VRelative;

.field public o:Lv/VDraweeView;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VImage;

.field public s:Lv/VLinear;

.field public t:Lv/VButton;

.field public u:Lv/VText;

.field public v:Lcom/p1/mobile/putong/core/ui/account/AccountRecommendAct;

.field public w:Ll/kv;

.field public x:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/AccountRecommendAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qv;->v:Lcom/p1/mobile/putong/core/ui/account/AccountRecommendAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/qv;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qv;->l(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Ll/qv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qv;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qv;->p(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qv;->m(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qv;->n(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qv;->v:Lcom/p1/mobile/putong/core/ui/account/AccountRecommendAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rv;->b(Ll/qv;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/kv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qv;->w:Ll/kv;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kv;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qv;->i(Ll/kv;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qv;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qv;->i:Lv/VRelative;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/qv;->n:Lv/VRelative;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

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
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Jk(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p2, p2, p1}, Ll/qv;->s(IILcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qv;->q(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 v0, 0x2

    .line 3
    invoke-virtual {p0, p2, v0, p1}, Ll/qv;->s(IILcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/qv;->q(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p2, p2, p1}, Ll/qv;->s(IILcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qv;->q(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V
    .locals 2

    .line 1
    const-string v0, "match"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->l7(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string v0, "see"

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/qv;->w:Ll/kv;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v0, 0x1

    .line 56
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Ll/pv;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/pv;-><init>(Ll/qv;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    const-string v0, "quick_chat"

    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Si(Lcom/p1/mobile/android/app/Act;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    const-string v0, "none"

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v1, "cards"

    .line 122
    .line 123
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 131
    .line 132
    .line 133
    :cond_3
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qv;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    new-instance v1, Ll/lv;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/lv;-><init>(Ll/qv;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/qv;->e:Lv/VText;

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/qv;->g:Lv/VText;

    .line 23
    .line 24
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    new-instance v0, Landroid/text/SpannableString;

    .line 58
    .line 59
    iget-object v2, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 62
    .line 63
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const-string v4, "\u4eb2\u7231\u7684%s"

    .line 68
    .line 69
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-direct {v0, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    new-instance v2, Landroid/text/style/StyleSpan;

    .line 77
    .line 78
    invoke-direct {v2, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    add-int/2addr v3, v1

    .line 90
    const/16 v4, 0x21

    .line 91
    .line 92
    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/qv;->c:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    :cond_0
    new-instance v0, Ljava/util/Random;

    .line 101
    .line 102
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 103
    .line 104
    .line 105
    const/4 v1, 0x4

    .line 106
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v1, p0, Ll/qv;->h:Lv/VText;

    .line 111
    .line 112
    if-nez v0, :cond_1

    .line 113
    .line 114
    const-string v0, "900m"

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v0, "km"

    .line 126
    .line 127
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    :goto_0
    iget-object v2, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-eqz v2, :cond_2

    .line 141
    .line 142
    const-string v2, "\u4ed6"

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_2
    const-string v2, "\u5979"

    .line 146
    .line 147
    :goto_1
    filled-new-array {v0, v2}, [Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v2, "\u4eca\u65e5\u4efd\u5fc3\u52a8\u5df2\u9001\u8fbe\uff0c\u6700\u8fd1\u7684\u79bb\u4f60\u53ea\u6709%s\uff0c\u5feb\u6765\u770b\u770b%s\u662f\u8c01\u5427"

    .line 152
    .line 153
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    :cond_3
    iget-object v0, p0, Ll/qv;->h:Lv/VText;

    .line 161
    .line 162
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/qv;->f:Lv/VText;

    .line 174
    .line 175
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/qv;->u:Lv/VText;

    .line 187
    .line 188
    iget-object v1, p0, Ll/qv;->w:Ll/kv;

    .line 189
    .line 190
    invoke-virtual {v1}, Ll/kv;->n0()Landroid/view/View$OnClickListener;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Ll/qv;->t:Lv/VButton;

    .line 198
    .line 199
    iget-object p0, p0, Ll/qv;->w:Ll/kv;

    .line 200
    .line 201
    invoke-virtual {p0}, Ll/kv;->z0()Landroid/view/View$OnClickListener;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public s(IILcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V
    .locals 7

    .line 1
    const-string v0, "%s"

    .line 2
    .line 3
    const-string v1, "recommend_user_location"

    .line 4
    .line 5
    const-string v2, "uid_report"

    .line 6
    .line 7
    const-string v3, "user_from_where"

    .line 8
    .line 9
    const-string v4, "e_delete_account_chat_block_recommend_user"

    .line 10
    .line 11
    const-string v5, ""

    .line 12
    .line 13
    if-nez p1, :cond_2

    .line 14
    .line 15
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p1, Ll/pf60;

    .line 24
    .line 25
    iget-object v6, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    if-nez v6, :cond_0

    .line 32
    .line 33
    iget-object v6, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v6, v5

    .line 37
    :goto_0
    invoke-direct {p1, v3, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    new-instance v3, Ll/pf60;

    .line 41
    .line 42
    iget-object v6, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-nez v6, :cond_1

    .line 49
    .line 50
    iget-object v5, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->id:Ljava/lang/String;

    .line 51
    .line 52
    :cond_1
    invoke-direct {v3, v2, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    new-instance p3, Ll/pf60;

    .line 56
    .line 57
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-direct {p3, v1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    filled-new-array {p1, v3, p3}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {v4, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance p1, Ll/pf60;

    .line 89
    .line 90
    iget-object v6, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-nez v6, :cond_3

    .line 97
    .line 98
    iget-object v6, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    move-object v6, v5

    .line 102
    :goto_1
    invoke-direct {p1, v3, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    new-instance v3, Ll/pf60;

    .line 106
    .line 107
    iget-object v6, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->id:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    if-nez v6, :cond_4

    .line 114
    .line 115
    iget-object v5, p3, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->id:Ljava/lang/String;

    .line 116
    .line 117
    :cond_4
    invoke-direct {v3, v2, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    new-instance p3, Ll/pf60;

    .line 121
    .line 122
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-direct {p3, v1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    filled-new-array {p1, v3, p3}, [Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {v4, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/widget/TextView;Landroid/widget/TextView;Lv/VDraweeView;Lv/VImage;)V
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->age:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "%s\u5c81"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->name:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->avatar:Ljava/lang/String;

    .line 38
    .line 39
    const/4 p3, 0x0

    .line 40
    invoke-virtual {p0, p4, p2, p3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    const-string p0, "none"

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;->type:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    sget p0, Ll/kbc0;->A1:I

    .line 54
    .line 55
    invoke-virtual {p5, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/data/LogoutCounter;)V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-object v2, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 22
    .line 23
    double-to-long v2, v2

    .line 24
    sub-long/2addr v0, v2

    .line 25
    const-wide/32 v2, 0x5265c00

    .line 26
    .line 27
    .line 28
    cmp-long v0, v0, v2

    .line 29
    .line 30
    if-gez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/qv;->f:Lv/VText;

    .line 33
    .line 34
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    iget-object p0, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 41
    .line 42
    double-to-long v3, v3

    .line 43
    sub-long/2addr v1, v3

    .line 44
    const-wide/32 v3, 0x36ee80

    .line 45
    .line 46
    .line 47
    div-long/2addr v1, v3

    .line 48
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->liked:I

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget p1, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->matches:I

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    filled-new-array {p0, v1, p1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "\u60a8\u5728\u63a2\u63a2\u7684%dh\uff0c\u5171\u8ba1\u6536\u83b7\u559c\u6b22\u4f60%d\u4eba\uff0c\u6210\u529f\u914d\u5bf9%d\u4eba\uff0c\u7ee7\u7eed\u6ed1\u5361\u66f4\u6709\u51e0\u7387\u627e\u5230\u4f60\u559c\u6b22\u7684\u90a3\u4e2ata\u54e6"

    .line 69
    .line 70
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->moments:I

    .line 79
    .line 80
    iget-object v1, p0, Ll/qv;->f:Lv/VText;

    .line 81
    .line 82
    if-nez v0, :cond_1

    .line 83
    .line 84
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object p0, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 95
    .line 96
    double-to-long v2, v2

    .line 97
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->jt(Ljava/lang/Long;)I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->liked:I

    .line 110
    .line 111
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget p1, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->matches:I

    .line 116
    .line 117
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    filled-new-array {p0, v0, p1}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-string p1, "\u60a8\u5728\u63a2\u63a2\u7684%d\u5929\uff0c\u5171\u8ba1\u6536\u83b7\u559c\u6b22\u4f60%d\u4eba\uff0c\u6210\u529f\u914d\u5bf9%d\u4eba\uff0c\u4e3b\u52a8\u51fa\u51fb\u66f4\u6709\u51e0\u7387\u627e\u5230\u4f60\u559c\u6b22\u7684\u90a3\u4e2ata\u54e6"

    .line 126
    .line 127
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget-object p0, p0, Ll/qv;->x:Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 146
    .line 147
    double-to-long v2, v2

    .line 148
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->jt(Ljava/lang/Long;)I

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget p0, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->liked:I

    .line 161
    .line 162
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    iget p0, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->matches:I

    .line 167
    .line 168
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    iget p0, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->moments:I

    .line 173
    .line 174
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    iget p0, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->momentLiked:I

    .line 179
    .line 180
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    iget p0, p1, Lcom/p1/mobile/putong/core/data/LogoutCounter;->followers:I

    .line 185
    .line 186
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    filled-new-array/range {v2 .. v7}, [Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    const-string p1, "\u60a8\u5728\u63a2\u63a2\u7684%d\u5929\uff0c\u5171\u8ba1\u6536\u83b7\u559c\u6b22\u4f60%d\u4eba\uff0c\u6210\u529f\u914d\u5bf9%d\u4eba\uff0c\u53d1\u5e03\u52a8\u6001%d\u6761\uff0c\u83b7\u8d5e%d\u4e2a\uff0c\u6536\u83b7\u5173\u6ce8%d\u4eba"

    .line 195
    .line 196
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    :cond_2
    return-void
.end method

.method public w(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    if-eqz v2, :cond_2

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x2

    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    if-ne v2, v3, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;

    .line 21
    .line 22
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    move-object v6, v1

    .line 27
    check-cast v6, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;

    .line 28
    .line 29
    invoke-virtual {p0, v5, v4, v2}, Ll/qv;->s(IILcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v5, v3, v6}, Ll/qv;->s(IILcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 33
    .line 34
    .line 35
    move-object v1, v2

    .line 36
    iget-object v2, p0, Ll/qv;->l:Lv/VText;

    .line 37
    .line 38
    iget-object v3, p0, Ll/qv;->k:Lv/VText;

    .line 39
    .line 40
    iget-object v4, p0, Ll/qv;->j:Lv/VDraweeView;

    .line 41
    .line 42
    iget-object v5, p0, Ll/qv;->m:Lv/VImage;

    .line 43
    .line 44
    move-object v0, p0

    .line 45
    invoke-virtual/range {v0 .. v5}, Ll/qv;->u(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/widget/TextView;Landroid/widget/TextView;Lv/VDraweeView;Lv/VImage;)V

    .line 46
    .line 47
    .line 48
    move-object v7, v1

    .line 49
    iget-object v2, p0, Ll/qv;->q:Lv/VText;

    .line 50
    .line 51
    iget-object v3, p0, Ll/qv;->p:Lv/VText;

    .line 52
    .line 53
    iget-object v4, p0, Ll/qv;->o:Lv/VDraweeView;

    .line 54
    .line 55
    iget-object v5, p0, Ll/qv;->r:Lv/VImage;

    .line 56
    .line 57
    move-object v1, v6

    .line 58
    invoke-virtual/range {v0 .. v5}, Ll/qv;->u(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/widget/TextView;Landroid/widget/TextView;Lv/VDraweeView;Lv/VImage;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Ll/qv;->i:Lv/VRelative;

    .line 62
    .line 63
    new-instance v3, Ll/mv;

    .line 64
    .line 65
    invoke-direct {v3, p0, v7}, Ll/mv;-><init>(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Ll/qv;->n:Lv/VRelative;

    .line 72
    .line 73
    new-instance v3, Ll/nv;

    .line 74
    .line 75
    invoke-direct {v3, p0, v1}, Ll/nv;-><init>(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-ne v2, v4, :cond_1

    .line 87
    .line 88
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;

    .line 93
    .line 94
    invoke-virtual {p0, v5, v4, v1}, Ll/qv;->s(IILcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Ll/qv;->n:Lv/VRelative;

    .line 98
    .line 99
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Ll/qv;->l:Lv/VText;

    .line 103
    .line 104
    iget-object v3, p0, Ll/qv;->k:Lv/VText;

    .line 105
    .line 106
    iget-object v4, p0, Ll/qv;->j:Lv/VDraweeView;

    .line 107
    .line 108
    iget-object v5, p0, Ll/qv;->m:Lv/VImage;

    .line 109
    .line 110
    move-object v0, p0

    .line 111
    invoke-virtual/range {v0 .. v5}, Ll/qv;->u(Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/widget/TextView;Landroid/widget/TextView;Lv/VDraweeView;Lv/VImage;)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Ll/qv;->i:Lv/VRelative;

    .line 115
    .line 116
    new-instance v3, Ll/ov;

    .line 117
    .line 118
    invoke-direct {v3, p0, v1}, Ll/ov;-><init>(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    :cond_1
    return-void

    .line 125
    :cond_2
    invoke-virtual {p0}, Ll/qv;->j()V

    .line 126
    .line 127
    .line 128
    return-void
.end method
