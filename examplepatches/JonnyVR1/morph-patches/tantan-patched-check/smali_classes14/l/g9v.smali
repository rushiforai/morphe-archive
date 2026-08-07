.class public Ll/g9v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/w8v;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VImage;

.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Z

.field public h:Lv/VFrame;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationBar;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/g9v;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/g9v;->e:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/g9v;->f:Ljava/util/List;

    .line 24
    .line 25
    iput-object p1, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 26
    .line 27
    iput-boolean p2, p0, Ll/g9v;->g:Z

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "live_internal_voice_search"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Ll/g9v;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g9v;->u(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/g9v;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g9v;->v(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/g9v;->p(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "e_audio_room_rank_button"

    .line 9
    .line 10
    const-string p1, "p_audio_explore_recommend"

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/g9v;->p(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "e_audio_room_rank_button"

    .line 9
    .line 10
    const-string p1, "p_audio_explore_recommend"

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "live_internal_my_room_frag"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic k(Ll/g9v;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/g9v;->w(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    return-void
.end method

.method private m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method private n(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->type:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v3, p0, Ll/g9v;->f:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->type:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    return v0

    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public static p(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-static {}, Ll/efv;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "extra_is_need_status_bar_hide"

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method private s(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/g9v;->f:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ll/g9v;->n(Ljava/util/List;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method private z(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ge v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 29
    .line 30
    instance-of v3, v1, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    .line 31
    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    check-cast v1, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    .line 35
    .line 36
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->type:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->c(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_0

    .line 43
    .line 44
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->showRedDot:Z

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->e(Z)V

    .line 47
    .line 48
    .line 49
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, p2}, Ll/g9v;->s(Ljava/util/List;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/g9v;->f:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/g9v;->e:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Ll/g9v;->f:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Ll/g9v;->f:Ljava/util/List;

    .line 44
    .line 45
    new-instance v1, Ll/f9v;

    .line 46
    .line 47
    invoke-direct {v1, p0, v0, p1}, Ll/f9v;-><init>(Ll/g9v;Ljava/util/List;Lcom/p1/mobile/android/app/Act;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p1, p0, Ll/g9v;->e:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/g9v;->e:Ljava/util/List;

    .line 59
    .line 60
    iget-object p2, p0, Ll/g9v;->d:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 66
    .line 67
    iget-object p0, p0, Ll/g9v;->e:Ljava/util/List;

    .line 68
    .line 69
    new-array p2, v2, [Landroid/view/View;

    .line 70
    .line 71
    invoke-interface {p0, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, [Landroid/view/View;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_2

    .line 92
    .line 93
    iget-object p1, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 94
    .line 95
    iget-object p0, p0, Ll/g9v;->d:Ljava/util/List;

    .line 96
    .line 97
    new-array p2, v2, [Landroid/view/View;

    .line 98
    .line 99
    invoke-interface {p0, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    check-cast p0, [Landroid/view/View;

    .line 104
    .line 105
    invoke-virtual {p1, p0}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_3

    .line 114
    .line 115
    invoke-direct {p0, p2}, Ll/g9v;->z(Ljava/util/List;)V

    .line 116
    .line 117
    .line 118
    :cond_3
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/g9v;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 2
    .line 3
    iget-object p0, p0, Ll/g9v;->b:Lv/VImage;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->showMyGuild:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w8v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g9v;->l(Ll/w8v;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public l(Ll/w8v;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V
    .locals 3

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u5728\u7ebf\u4ea4\u53cb"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    const/high16 v1, 0x41a80000    # 21.0f

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Ll/m9c0;->C:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 35
    .line 36
    .line 37
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    sget v2, Ll/qa00;->c:I

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    sget v2, Ll/m9c0;->H:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    iget-boolean v1, p0, Ll/g9v;->g:Z

    .line 61
    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    invoke-virtual {p0, p1, p2, v0}, Ll/g9v;->x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;Lv/VText;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-virtual {p0, p1}, Ll/g9v;->y(Lcom/p1/mobile/android/app/Act;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/g9v;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->myGuildH5Link:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p2, "extra_is_need_status_bar_hide"

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/g9v;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->myGuildH5Link:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p2, "extra_is_need_status_bar_hide"

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic w(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3}, Ll/g9v;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;Lv/VText;)V
    .locals 5

    .line 1
    new-instance v0, Lv/VImage;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/nbc0;->p1:I

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/a9v;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/a9v;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lv/VImage;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget v2, Ll/nbc0;->A:I

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/b9v;

    .line 38
    .line 39
    invoke-direct {v2, p1}, Ll/b9v;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Lv/VImage;

    .line 46
    .line 47
    invoke-direct {v2, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    sget v3, Ll/nbc0;->B:I

    .line 51
    .line 52
    invoke-virtual {p1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v2, v3}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    new-instance v3, Ll/c9v;

    .line 60
    .line 61
    invoke-direct {v3, p1}, Ll/c9v;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    new-instance v3, Lv/VImage;

    .line 68
    .line 69
    invoke-direct {v3, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    iput-object v3, p0, Ll/g9v;->b:Lv/VImage;

    .line 73
    .line 74
    sget v4, Ll/nbc0;->B1:I

    .line 75
    .line 76
    invoke-virtual {p1, v4}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v3, v4}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    iget-object v3, p0, Ll/g9v;->b:Lv/VImage;

    .line 84
    .line 85
    new-instance v4, Ll/d9v;

    .line 86
    .line 87
    invoke-direct {v4, p0, p1}, Ll/d9v;-><init>(Ll/g9v;Lcom/p1/mobile/android/app/Act;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v3, p0, Ll/g9v;->b:Lv/VImage;

    .line 94
    .line 95
    const/4 v4, 0x0

    .line 96
    invoke-static {v3, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v3, p0, Ll/g9v;->d:Ljava/util/List;

    .line 100
    .line 101
    iget-object v4, p0, Ll/g9v;->b:Lv/VImage;

    .line 102
    .line 103
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    iget-object v3, p0, Ll/g9v;->d:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/g9v;->d:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/g9v;->d:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    sget v0, Ll/m9c0;->c:I

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 128
    .line 129
    .line 130
    if-eqz p2, :cond_0

    .line 131
    .line 132
    const-string p0, ""

    .line 133
    .line 134
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_0
    sget p2, Ll/m9c0;->c:I

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 145
    .line 146
    .line 147
    new-instance p2, Lv/VImage;

    .line 148
    .line 149
    invoke-direct {p2, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 150
    .line 151
    .line 152
    sget p3, Ll/nbc0;->m1:I

    .line 153
    .line 154
    invoke-virtual {p1, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    invoke-virtual {p2, p3}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 159
    .line 160
    .line 161
    iget-object p3, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 162
    .line 163
    invoke-virtual {p3, p2}, Lv/navigationbar/VNavigationBar;->setLeftIconView(Landroid/view/View;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 167
    .line 168
    new-instance p2, Ll/e9v;

    .line 169
    .line 170
    invoke-direct {p2, p1}, Ll/e9v;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, p2}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public final y(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Lv/VImage;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/nbc0;->m1:I

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/g9v;->a:Lv/navigationbar/VNavigationBar;

    .line 21
    .line 22
    new-instance v1, Ll/x8v;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Ll/x8v;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Lv/VImage;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    sget v1, Ll/nbc0;->p1:I

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/y8v;

    .line 45
    .line 46
    invoke-direct {v1, p1}, Ll/y8v;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Lv/VImage;

    .line 53
    .line 54
    invoke-direct {v1, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Ll/g9v;->b:Lv/VImage;

    .line 58
    .line 59
    sget v2, Ll/nbc0;->B1:I

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/g9v;->b:Lv/VImage;

    .line 69
    .line 70
    new-instance v2, Ll/z8v;

    .line 71
    .line 72
    invoke-direct {v2, p0, p1}, Ll/z8v;-><init>(Ll/g9v;Lcom/p1/mobile/android/app/Act;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/g9v;->b:Lv/VImage;

    .line 79
    .line 80
    const/4 v2, 0x0

    .line 81
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Lv/VFrame;

    .line 85
    .line 86
    invoke-direct {v1, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    iput-object v1, p0, Ll/g9v;->h:Lv/VFrame;

    .line 90
    .line 91
    iget-object v1, p0, Ll/g9v;->d:Ljava/util/List;

    .line 92
    .line 93
    iget-object v2, p0, Ll/g9v;->b:Lv/VImage;

    .line 94
    .line 95
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Ll/g9v;->d:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/g9v;->d:Ljava/util/List;

    .line 104
    .line 105
    iget-object p0, p0, Ll/g9v;->h:Lv/VFrame;

    .line 106
    .line 107
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    sget p0, Ll/m9c0;->c:I

    .line 111
    .line 112
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 117
    .line 118
    .line 119
    sget p0, Ll/m9c0;->c:I

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 126
    .line 127
    .line 128
    return-void
.end method
