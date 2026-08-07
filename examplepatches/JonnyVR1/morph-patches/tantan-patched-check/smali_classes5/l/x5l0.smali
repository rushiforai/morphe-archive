.class public Ll/x5l0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z = true

.field public static b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Ll/kcg0;

.field public static d:Ll/kcg0;

.field public static e:Ll/kcg0;

.field public static f:Lcom/p1/mobile/putong/data/StudentVerificationStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/x5l0;->b:Lrx/subjects/b;

    .line 6
    .line 7
    const-string v0, "unknown_"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/x5l0;->f:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const-string p2, "tantan://myMeet"

    .line 16
    .line 17
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p0, p2}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p2, "tantanapp://seeLikes?preferredShowPurchase=true&preferredShowDetail=true"

    .line 26
    .line 27
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p0, p2}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->I()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-wide/16 v0, 0x1770

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ud2;->n(J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic c()V
    .locals 1

    .line 1
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ud2;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static f(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "fakeBatch"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "avatar_compare"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "fromPicVerificationDlg"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, "alive"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string v0, "fromNameVerificationDlg"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "id_info"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string p0, ""

    .line 35
    .line 36
    return-object p0
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "fakeBatch"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "fake_appeal"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "fromPicVerificationDlg"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    const-string v0, "fromNameVerificationDlg"

    .line 21
    .line 22
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p0, ""

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    :goto_0
    const-string p0, "security_force_verification"

    .line 33
    .line 34
    return-object p0
.end method

.method public static h(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const-string p0, "avatar_verification"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_1

    .line 9
    .line 10
    const-string p0, "id_verification"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const/4 v0, 0x3

    .line 14
    if-ne p0, v0, :cond_2

    .line 15
    .line 16
    const-string p0, "country_verification"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const-string p0, "-1"

    .line 20
    .line 21
    return-object p0
.end method

.method public static i(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "fromNameVerificationDlg"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "id_ability"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "appeal"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, "appeal_verification"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string v0, "fakeBatch"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_3

    .line 30
    .line 31
    const-string v0, "fromPicVerificationDlg"

    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-static {p1}, Ll/x5l0;->h(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_3
    :goto_0
    const-string p0, "avatar_ability"

    .line 46
    .line 47
    return-object p0
.end method

.method public static j()V
    .locals 1

    .line 1
    sget-object v0, Ll/x5l0;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/x5l0;->d:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/x5l0;->e:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "unknown_"

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Ll/x5l0;->f:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 23
    .line 24
    return-void
.end method

.method public static k(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/dgq;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/dgq;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Ll/egq;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/egq;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/v5l0;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Ll/v5l0;-><init>(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/w5l0;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/w5l0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static l(Landroid/app/Activity;ZLcom/p1/mobile/putong/core/data/InvitationInfo;)V
    .locals 6

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->l3()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/InvitationInfo;->inviterAvatars:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget v3, Ll/kec0;->g6:I

    .line 40
    .line 41
    invoke-virtual {p1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealSuccessLayout;

    .line 46
    .line 47
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/InvitationInfo;->inviterAvatars:Ljava/util/List;

    .line 48
    .line 49
    iget p2, p2, Lcom/p1/mobile/putong/core/data/InvitationInfo;->invitationCount:I

    .line 50
    .line 51
    invoke-virtual {p1, v3, p2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealSuccessLayout;->c(Ljava/util/List;I)V

    .line 52
    .line 53
    .line 54
    move p2, v0

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 65
    .line 66
    invoke-direct {p2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v3, "Frame_1942189003"

    .line 82
    .line 83
    invoke-static {p2, p1, v3}, Ll/x5l0;->k(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    sget v3, Ll/kec0;->Vc:I

    .line 91
    .line 92
    invoke-virtual {p1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget v3, Ll/adc0;->gd:I

    .line 97
    .line 98
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Lcom/tantan/library/svga/SVGAnimationView;

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    const-string v5, "verify_success_bubble_svga"

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-nez v4, :cond_2

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    goto :goto_0

    .line 129
    :cond_2
    const-string v4, "https://auto.tancdn.com/v1/raw/67af95b5-ccd5-4c33-8555-cbdf23025e9014.svga"

    .line 130
    .line 131
    :goto_0
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-virtual {v5, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-virtual {v4, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {v4, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {p2, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 151
    .line 152
    .line 153
    move p2, v1

    .line 154
    :goto_1
    new-instance v3, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 155
    .line 156
    invoke-direct {v3, p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 157
    .line 158
    .line 159
    const-string v4, "VERIFIED_SUCCESS"

    .line 160
    .line 161
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->u(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->v(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    sget-object v4, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->VERIFIED_SUCCESS:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 170
    .line 171
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    const/4 v4, 0x5

    .line 176
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->A(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    const/16 v4, 0x1388

    .line 181
    .line 182
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    if-eqz p2, :cond_3

    .line 187
    .line 188
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->C(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->D(Ll/qcj;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->x(Ll/qcj;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->E(Z)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_3
    const/4 v0, 0x2

    .line 205
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 210
    .line 211
    const/high16 v2, 0x42700000    # 60.0f

    .line 212
    .line 213
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    const/4 v4, -0x2

    .line 218
    invoke-direct {v1, v4, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->y(Landroid/view/ViewGroup$LayoutParams;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 222
    .line 223
    .line 224
    :goto_2
    invoke-virtual {v3}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    new-instance v1, Ll/s5l0;

    .line 229
    .line 230
    invoke-direct {v1, p0}, Ll/s5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, v1}, Ll/jlb0;->s(Ll/x20;)V

    .line 234
    .line 235
    .line 236
    new-instance v1, Ll/t5l0;

    .line 237
    .line 238
    invoke-direct {v1}, Ll/t5l0;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, v1}, Ll/jlb0;->q(Ll/x20;)V

    .line 242
    .line 243
    .line 244
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-virtual {v1, v0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 249
    .line 250
    .line 251
    if-nez p2, :cond_4

    .line 252
    .line 253
    new-instance p2, Ll/u5l0;

    .line 254
    .line 255
    invoke-direct {p2, p0, v0}, Ll/u5l0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    .line 256
    .line 257
    .line 258
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 259
    .line 260
    .line 261
    :cond_4
    :goto_3
    return-void
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method
