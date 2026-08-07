.class public Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/clf;

.field public d:Ll/rlf;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/data/User;

.field public i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public j:I

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "from"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "type"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "user"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "index"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p0, "user_info"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    return-object v0
.end method


# virtual methods
.method public final Y1()Ll/clf;
    .locals 7

    .line 1
    new-instance v0, Ll/clf;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->f:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->h:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->j:I

    .line 12
    .line 13
    move-object v1, p0

    .line 14
    invoke-direct/range {v0 .. v6}, Ll/clf;-><init>(Ll/ner;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public final Z1()Ll/rlf;
    .locals 1

    .line 1
    new-instance v0, Ll/rlf;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rlf;-><init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final a2()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$b;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->f:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getTypeByAlias(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    aget v0, v0, v1

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "profile_like_button"

    .line 17
    .line 18
    if-eq v0, v1, :cond_3

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    const/4 v1, 0x4

    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->e:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "avatar"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string v0, "photo"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const-string v0, "answer"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const-string v0, "self_introduction"

    .line 44
    .line 45
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 54
    .line 55
    iget v1, v1, Lcom/p1/mobile/putong/data/ProfileLike;->remaining:I

    .line 56
    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v3, "profile_like_limit"

    .line 62
    .line 63
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v3, "profile_module"

    .line 68
    .line 69
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v3, "send_profile_like_from"

    .line 74
    .line 75
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    filled-new-array {v1, v0, v2}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public checkGradientColors()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->d:Ll/rlf;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rlf;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "from"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->e:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "type"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->f:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "user"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->g:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "user_info"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "index"

    .line 69
    .line 70
    const/4 v2, 0x0

    .line 71
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->j:I

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const-string v1, "EXT_VALUE"

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->k:Ljava/lang/String;

    .line 88
    .line 89
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->g:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->g:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ll/dkb;->M7(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->h:Lcom/p1/mobile/putong/data/User;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->Y1()Ll/clf;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->c:Ll/clf;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->Z1()Ll/rlf;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->d:Ll/rlf;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->c:Ll/clf;

    .line 123
    .line 124
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->a2()V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->c:Ll/clf;

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/clf;->l0()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->c:Ll/clf;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->c:Ll/clf;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/clf;->a0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onPointerCaptureChanged(Z)V
    .locals 0

    return-void
.end method

.method public onStartLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->d:Ll/rlf;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/rlf;->Y(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_send_profile_like"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    move-object v4, v0

    .line 10
    check-cast v4, Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/16 v1, 0x9

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/Window;->hasFeature(I)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/high16 v0, 0x42600000    # 56.0f

    .line 33
    .line 34
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    move v0, v1

    .line 40
    :goto_1
    invoke-static {}, Ll/bnl0;->F0()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    invoke-virtual {p1, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v4, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;

    .line 52
    .line 53
    move-object v2, p0

    .line 54
    move-object v5, p1

    .line 55
    move-object v6, p3

    .line 56
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;ZLandroid/view/ViewGroup;Landroid/view/View;Ll/b30;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 60
    .line 61
    .line 62
    return-object p2
.end method
