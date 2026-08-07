.class public Ll/gm70;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public final i:Lcom/p1/mobile/android/app/Act;

.field public final j:Lcom/p1/mobile/putong/data/User;

.field public final k:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public l:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gm70;->j:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gm70;->k:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic B(Ll/gm70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gm70;->I()V

    return-void
.end method

.method public static synthetic C(Ll/gm70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gm70;->J()V

    return-void
.end method

.method public static synthetic F(Ll/gm70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gm70;->H()V

    return-void
.end method

.method private synthetic H()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PICKS_GUIDE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/android/ui/poplevel/PopAction;->OTHER_ACTION:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "e_card_daily_picks_toast"

    .line 17
    .line 18
    const-string v1, "p_suggest_users_home_view"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gm70;->K()V

    .line 24
    .line 25
    .line 26
    new-instance v0, Landroid/content/Intent;

    .line 27
    .line 28
    iget-object v1, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    const-class v2, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public A()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    instance-of v2, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 21
    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 25
    .line 26
    if-eqz v2, :cond_4

    .line 27
    .line 28
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/hlh0;->h()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :cond_2
    invoke-virtual {p0}, Ll/gm70;->K()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget v2, Ll/kec0;->G8:I

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideView;

    .line 63
    .line 64
    iget-object v2, p0, Ll/gm70;->j:Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    iget-object v3, p0, Ll/gm70;->k:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 67
    .line 68
    new-instance v4, Ll/dm70;

    .line 69
    .line 70
    invoke-direct {v4, p0}, Ll/dm70;-><init>(Ll/gm70;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideView;->e(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/x20;)V

    .line 74
    .line 75
    .line 76
    new-instance v2, Landroid/widget/PopupWindow;

    .line 77
    .line 78
    const/4 v3, -0x1

    .line 79
    const/4 v4, -0x2

    .line 80
    invoke-direct {v2, v0, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 81
    .line 82
    .line 83
    iput-object v2, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 84
    .line 85
    const/4 v0, 0x1

    .line 86
    invoke-virtual {v2, v0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 90
    .line 91
    sget v3, Ll/agc0;->D:I

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 97
    .line 98
    new-instance v3, Ll/gm70$a;

    .line 99
    .line 100
    invoke-direct {v3, p0}, Ll/gm70$a;-><init>(Ll/gm70;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 107
    .line 108
    new-instance v3, Ll/em70;

    .line 109
    .line 110
    invoke-direct {v3, p0}, Ll/em70;-><init>(Ll/gm70;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 114
    .line 115
    .line 116
    iget-object v2, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_3

    .line 123
    .line 124
    iget-object v2, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-nez v2, :cond_3

    .line 131
    .line 132
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v2, v0}, Ll/hlh0;->k(Z)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    const v2, 0x1020002

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v2}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object v2, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 149
    .line 150
    sget v3, Ll/qa00;->q:I

    .line 151
    .line 152
    neg-int v3, v3

    .line 153
    const/16 v4, 0x31

    .line 154
    .line 155
    invoke-virtual {v2, v0, v4, v1, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 156
    .line 157
    .line 158
    const-string v0, "e_card_daily_picks_toast"

    .line 159
    .line 160
    const-string v1, "p_suggest_users_home_view"

    .line 161
    .line 162
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    new-instance v1, Ll/fm70;

    .line 168
    .line 169
    invoke-direct {v1, p0}, Ll/fm70;-><init>(Ll/gm70;)V

    .line 170
    .line 171
    .line 172
    const-wide/16 v2, 0x1770

    .line 173
    .line 174
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 175
    .line 176
    .line 177
    :cond_3
    const/16 p0, 0x1b58

    .line 178
    .line 179
    return p0

    .line 180
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 181
    .line 182
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_5

    .line 187
    .line 188
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 189
    .line 190
    invoke-interface {p0}, Ll/x20;->call()V

    .line 191
    .line 192
    .line 193
    :cond_5
    return v1
.end method

.method public final synthetic I()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

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
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic J()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PICKS_GUIDE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/android/ui/poplevel/PopAction;->AUTO_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/gm70;->K()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Ll/hlh0;->k(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/high16 v0, -0x3a860000    # -4000.0f

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gm70;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/gm70;->l:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->PICKS_GUIDE_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getGroup()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->PICKS_GUIDE_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
