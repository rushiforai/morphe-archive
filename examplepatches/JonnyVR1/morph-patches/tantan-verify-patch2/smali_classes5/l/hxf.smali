.class public Ll/hxf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:J

.field public static b:Ll/jxd0;

.field public static c:Ll/jxd0;

.field public static d:Lcom/p1/mobile/putong/data/PhoneNumber;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    const-string v2, "isVerificationByPicture"

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/hxf;->b:Ll/jxd0;

    .line 11
    .line 12
    new-instance v0, Ll/jxd0;

    .line 13
    .line 14
    const-string v2, "isVerificationByIDCard"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/hxf;->c:Ll/jxd0;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    sput-object v0, Ll/hxf;->d:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 23
    .line 24
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

.method public static synthetic a(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/hxf;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v6, 0x3

    .line 10
    const/4 v9, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    const-string v4, ""

    .line 13
    .line 14
    const-string v5, ""

    .line 15
    .line 16
    move-object v1, p0

    .line 17
    move-object v2, p1

    .line 18
    move v7, p2

    .line 19
    move-object v8, p3

    .line 20
    invoke-static/range {v1 .. v9}, Ll/hxf;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZLjava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Z
    .locals 1

    .line 1
    const-string v0, "appeal"

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "fakeBatch"

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "fromPicVerificationDlg"

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "fromNameVerificationDlg"

    .line 26
    .line 27
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const-string v0, "fromAccountBackH5"

    .line 34
    .line 35
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    if-nez p2, :cond_0

    .line 43
    .line 44
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 61
    .line 62
    const-string v0, "hidden"

    .line 63
    .line 64
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-eqz p2, :cond_0

    .line 73
    .line 74
    sget-object p2, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 75
    .line 76
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    check-cast p2, Ljava/lang/Integer;

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/dkb;->I7()Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p2, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-nez p2, :cond_0

    .line 95
    .line 96
    sget p2, Lcom/p1/mobile/putong/core/R$string;->hs:I

    .line 97
    .line 98
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 107
    .line 108
    .line 109
    return p1

    .line 110
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 113
    .line 114
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isVedioforFp()Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_1

    .line 123
    .line 124
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ls:I

    .line 125
    .line 126
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 135
    .line 136
    .line 137
    return p1

    .line 138
    :cond_1
    const/4 p0, 0x1

    .line 139
    return p0
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/hxf;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    const-string v4, ""

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const-string v3, ""

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move v6, p2

    .line 10
    invoke-static/range {v0 .. v6}, Ll/hxf;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZ)V
    .locals 9

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v8, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move v5, p5

    .line 9
    move v6, p6

    .line 10
    invoke-static/range {v0 .. v8}, Ll/hxf;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZLjava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZLjava/lang/String;Z)V
    .locals 10

    .line 1
    invoke-static {}, Ll/wiw;->m()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p5}, Ll/x5l0;->i(Ljava/lang/String;I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p1, v0}, Ll/d3l0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/hxf;->l()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Ll/o3l0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/o3l0;-><init>()V

    .line 21
    .line 22
    .line 23
    const/4 v7, 0x0

    .line 24
    move-object v1, p0

    .line 25
    move-object v2, p1

    .line 26
    move v3, p2

    .line 27
    move-object v4, p3

    .line 28
    move-object v5, p4

    .line 29
    move v6, p5

    .line 30
    move-object/from16 v8, p7

    .line 31
    .line 32
    move/from16 v9, p8

    .line 33
    .line 34
    invoke-virtual/range {v0 .. v9}, Ll/o3l0;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZLjava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0, v0}, Ll/hxf;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)V
    .locals 10

    .line 1
    invoke-static {p0, p1, p3}, Ll/hxf;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v6, 0x1

    .line 9
    const/4 v8, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    const-string v4, ""

    .line 12
    .line 13
    const-string v5, ""

    .line 14
    .line 15
    move-object v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move v7, p2

    .line 18
    move v9, p3

    .line 19
    invoke-static/range {v1 .. v9}, Ll/hxf;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZLjava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static j()Lcom/p1/mobile/putong/data/PhoneNumber;
    .locals 1

    .line 1
    sget-object v0, Ll/hxf;->d:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 2
    .line 3
    return-object v0
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/q5l0;->D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static l()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/hxf;->a:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const-wide/16 v2, 0x3e8

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gez v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    return v0

    .line 20
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    sput-wide v0, Ll/hxf;->a:J

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    return v0
.end method

.method public static m(Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Ll/d4l0;->l(Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static n()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->p()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "1"

    .line 6
    .line 7
    invoke-static {v1}, Ll/y5l0;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->z(Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static o(Lcom/p1/mobile/putong/data/PhoneNumber;)V
    .locals 0

    .line 1
    sput-object p0, Ll/hxf;->d:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 2
    .line 3
    return-void
.end method

.method public static p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q5l0;->L(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 12

    .line 1
    const-string v0, "verification_center"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string v1, "p_avatar_verification_review_verification_center"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "p_avatar_verification_review_swipe_page"

    .line 13
    .line 14
    :goto_0
    const-class v2, Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v1, v2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    const-string v2, "active"

    .line 27
    .line 28
    :goto_1
    move-object v3, v2

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    const-string v2, "passive"

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :goto_2
    if-eqz p1, :cond_2

    .line 34
    .line 35
    const-string v2, "verification_center_avatar_button"

    .line 36
    .line 37
    :goto_3
    move-object v6, v2

    .line 38
    goto :goto_4

    .line 39
    :cond_2
    const-string v2, "card"

    .line 40
    .line 41
    goto :goto_3

    .line 42
    :goto_4
    if-eqz p1, :cond_3

    .line 43
    .line 44
    :goto_5
    move-object v7, v0

    .line 45
    goto :goto_6

    .line 46
    :cond_3
    const-string v0, "swipe_page"

    .line 47
    .line 48
    goto :goto_5

    .line 49
    :goto_6
    if-eqz p1, :cond_4

    .line 50
    .line 51
    const-string p1, "click"

    .line 52
    .line 53
    :goto_7
    move-object v8, p1

    .line 54
    goto :goto_8

    .line 55
    :cond_4
    const-string p1, "swipe"

    .line 56
    .line 57
    goto :goto_7

    .line 58
    :goto_8
    const-string v4, "alert"

    .line 59
    .line 60
    const-string v5, "alert_self_definition_basic"

    .line 61
    .line 62
    invoke-static/range {v3 .. v8}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v1, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 67
    .line 68
    .line 69
    sget p1, Lcom/p1/mobile/putong/core/R$string;->fs:I

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    sget p1, Lcom/p1/mobile/putong/core/R$string;->es:I

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    sget v5, Ll/dbc0;->jk:I

    .line 82
    .line 83
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    new-instance v11, Ll/gxf;

    .line 90
    .line 91
    invoke-direct {v11, v1}, Ll/gxf;-><init>(Ll/l4g0;)V

    .line 92
    .line 93
    .line 94
    const/4 v7, 0x0

    .line 95
    const/4 v8, 0x0

    .line 96
    const/4 v9, 0x0

    .line 97
    const/4 v10, 0x0

    .line 98
    move-object v2, p0

    .line 99
    invoke-static/range {v2 .. v11}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->E1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method
