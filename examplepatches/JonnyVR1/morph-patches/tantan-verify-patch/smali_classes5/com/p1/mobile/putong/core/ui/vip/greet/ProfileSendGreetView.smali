.class public Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/v3m;


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

.field public e:Landroid/widget/TextView;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lcom/p1/mobile/putong/data/User;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->a0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->b0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method private X(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/j;->H6(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private getVasTracker()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "from_meet_picks_feed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "from_new_meet_picks_feed"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "from_meet_picks_card"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "from_meet_feed"

    .line 35
    .line 36
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "from_meet_profile"

    .line 45
    .line 46
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const-string p0, "e_meet_card_sayhi"

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_2
    :goto_0
    const-string p0, "p_meet_view,e_whoiliked_card,sayhi_superlike"

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_3
    :goto_1
    const-string p0, "p_meet_view,e_picks_feed_card,like_swipe"

    .line 60
    .line 61
    return-object p0
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/zza0;

    .line 2
    .line 3
    invoke-direct {p1, p0, p5}, Ll/zza0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e0b0;->a(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_greeting"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->g:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 25
    .line 26
    const-string v0, "female"

    .line 27
    .line 28
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    const-string p0, "femaleDoc"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception p0

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    const-string p0, "maleDoc"

    .line 40
    .line 41
    :goto_0
    new-instance v0, Lorg/json/JSONArray;

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_1

    .line 55
    .line 56
    const-string p0, ""

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 p0, 0x0

    .line 60
    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    move-object p0, p1

    .line 66
    :goto_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    return-object p1

    .line 73
    :cond_3
    return-object p0

    .line 74
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    return-object p1
.end method

.method public final Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->B5()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/a0b0;

    .line 19
    .line 20
    invoke-direct {v0, p2}, Ll/a0b0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/b0b0;

    .line 28
    .line 29
    invoke-direct {p2}, Ll/b0b0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/c0b0;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Ll/c0b0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/d0b0;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/d0b0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public Z()Z
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->getVasTracker()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "from_meet_picks_feed"

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v3, 0x1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 17
    .line 18
    const-string v4, "from_new_meet_picks_feed"

    .line 19
    .line 20
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 27
    .line 28
    const-string v4, "from_picks"

    .line 29
    .line 30
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 37
    .line 38
    const-string v4, "from_meet_picks_card"

    .line 39
    .line 40
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "from_new_meet_see_feed"

    .line 50
    .line 51
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    invoke-static {}, Ll/rbb0;->q()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->f:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    const-string v1, "e_send_message"

    .line 74
    .line 75
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 78
    .line 79
    .line 80
    return v3

    .line 81
    :cond_1
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 84
    .line 85
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    invoke-static {}, Ll/d7d0;->d()Ll/d7d0;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1}, Ll/d7d0;->c()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_3

    .line 104
    .line 105
    invoke-static {}, Ll/joa;->M3()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    invoke-static {}, Ll/joa;->H3()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-nez v1, :cond_4

    .line 116
    .line 117
    invoke-static {}, Ll/ela;->r3()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-gtz v1, :cond_4

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->f:Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    invoke-interface {v1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return v3

    .line 137
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_4

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->f:Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    invoke-interface {v1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return v3

    .line 159
    :cond_3
    invoke-static {}, Ll/d7d0;->d()Ll/d7d0;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v1}, Ll/d7d0;->e()Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-nez v1, :cond_4

    .line 168
    .line 169
    invoke-static {}, Ll/joa;->H3()Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-nez v1, :cond_4

    .line 174
    .line 175
    invoke-static {}, Ll/ela;->r3()I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-gtz v1, :cond_4

    .line 180
    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->f:Lcom/p1/mobile/android/app/Act;

    .line 190
    .line 191
    invoke-interface {v1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    return v3

    .line 195
    :cond_4
    const/4 p0, 0x0

    .line 196
    return p0
.end method

.method public final synthetic a0(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->g:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const-string v0, "is_reply"

    .line 23
    .line 24
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "is_match"

    .line 29
    .line 30
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->g:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    const-string v2, "owner_id"

    .line 39
    .line 40
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    filled-new-array {v0, p2, v1}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const-string v0, "e_send_message"

    .line 49
    .line 50
    const-string v1, "p_suggest_user_profile_info_view"

    .line 51
    .line 52
    invoke-static {v0, v1, p2}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->Z()Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->g:Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-direct {p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const-string p1, "p_profile,greet"

    .line 72
    .line 73
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->f:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    return-void
.end method

.method public final b0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->e:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->g:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const-string v1, "\u5979"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v1, "\u4ed6"

    .line 31
    .line 32
    :goto_0
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "\u56de\u5e94%s"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-static {p1}, Ll/k1l;->b(Ljava/util/List;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget v2, Ll/c9c0;->d:I

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;->setTextList(Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;->p()V

    .line 82
    .line 83
    .line 84
    :cond_2
    return-void
.end method

.method public getEnvelopSayHai()Landroid/widget/TextView;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->g:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->X(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

    .line 16
    .line 17
    sget-object p4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 18
    .line 19
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;->setTypeface(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->e:Landroid/widget/TextView;

    .line 28
    .line 29
    sget p4, Lcom/p1/mobile/putong/core/R$string;->V4:I

    .line 30
    .line 31
    invoke-virtual {p1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->e:Landroid/widget/TextView;

    .line 39
    .line 40
    const-string p2, "#ffc318"

    .line 41
    .line 42
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

    .line 50
    .line 51
    const-string p2, "#26000000"

    .line 52
    .line 53
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

    .line 61
    .line 62
    const/high16 p2, 0x41600000    # 14.0f

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;->setTextSize(F)V

    .line 65
    .line 66
    .line 67
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->c:Lv/VDraweeView;

    .line 70
    .line 71
    sget p4, Ll/dbc0;->M:I

    .line 72
    .line 73
    invoke-virtual {p1, p2, p4}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 74
    .line 75
    .line 76
    new-instance p1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string p2, "\u804a\u804a"

    .line 79
    .line 80
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p3, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 84
    .line 85
    const-string p3, "female"

    .line 86
    .line 87
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-eqz p2, :cond_0

    .line 92
    .line 93
    const-string p2, "\u5979"

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    const-string p2, "\u4ed6"

    .line 97
    .line 98
    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p2, "\u7684\u52a8\u6001\u5427\uff0c\u66f4\u6709\u53ef\u80fd\u5f97\u5230\u56de\u590d"

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->W(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->d:Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/hello/VerticalTextSwitcher;->setText(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method
