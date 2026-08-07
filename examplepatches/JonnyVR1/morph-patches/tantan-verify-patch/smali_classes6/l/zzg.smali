.class public Ll/zzg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field public static final b:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "last_show_fake_comment_dialog_time_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/zzg;->a:Ll/byd0;

    .line 35
    .line 36
    new-instance v0, Ll/byd0;

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v3, "last_show_fake_post_moment_dialog_time_"

    .line 41
    .line 42
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 61
    .line 62
    .line 63
    sput-object v0, Ll/zzg;->b:Ll/byd0;

    .line 64
    .line 65
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

.method public static synthetic a(Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ki(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;Z)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 8
    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const p1, 0x9dad

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const p1, 0x9dae

    .line 22
    .line 23
    .line 24
    :goto_0
    if-ne p0, p1, :cond_5

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Landroid/app/Activity;

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/4 p0, 0x0

    .line 54
    :goto_1
    if-eqz p0, :cond_5

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    goto :goto_4

    .line 63
    :cond_2
    new-instance p1, Ll/th0$a;

    .line 64
    .line 65
    invoke-direct {p1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 66
    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 69
    .line 70
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->B:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget v0, Ll/k9c0;->n:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {}, Ll/l51;->D()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    goto :goto_2

    .line 101
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->queryMe()Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    :goto_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->jailedBusinessMomentHadReason()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 116
    .line 117
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->C:I

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 128
    .line 129
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->A:I

    .line 130
    .line 131
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sget v1, Ll/k9c0;->t:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    new-instance v1, Ll/yzg;

    .line 146
    .line 147
    invoke-direct {v1, p0}, Ll/yzg;-><init>(Landroid/app/Activity;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 151
    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_4
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->V4:I

    .line 155
    .line 156
    invoke-virtual {p1, p0}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 157
    .line 158
    .line 159
    :goto_3
    const/4 p0, 0x0

    .line 160
    invoke-virtual {p1, p0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 169
    .line 170
    .line 171
    :cond_5
    :goto_4
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    const-string p1, "p_fake_nearby_moment_popup"

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/zzg;->b:Ll/byd0;

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object p0, Ll/zzg;->a:Ll/byd0;

    .line 24
    .line 25
    invoke-static {}, Ll/pzi0;->o()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v1, Ll/qhh;

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-object v3, p1

    .line 14
    move-object v4, p2

    .line 15
    move-object v5, p3

    .line 16
    move v6, p4

    .line 17
    invoke-direct/range {v1 .. v6}, Ll/qhh;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ll/qhh;->show()V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Ll/zzg;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/y20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v1, Ll/o9i;

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-object v3, p1

    .line 14
    move-object v4, p2

    .line 15
    move-object v5, p3

    .line 16
    move-object v6, p4

    .line 17
    invoke-direct/range {v1 .. v6}, Ll/o9i;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "p_fake_nearby_moment_popup"

    .line 21
    .line 22
    invoke-static {v3, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const-wide/32 p1, 0x493e0

    .line 27
    .line 28
    .line 29
    const-wide/16 p3, 0x0

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    sget-object p0, Ll/zzg;->b:Ll/byd0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ljava/lang/Long;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 42
    .line 43
    .line 44
    move-result-wide v6

    .line 45
    cmp-long p0, v6, p3

    .line 46
    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    invoke-static {}, Ll/pzi0;->o()J

    .line 50
    .line 51
    .line 52
    move-result-wide p3

    .line 53
    sub-long/2addr p3, v6

    .line 54
    cmp-long p0, p3, p1

    .line 55
    .line 56
    if-gez p0, :cond_2

    .line 57
    .line 58
    invoke-interface {v5}, Ll/x20;->call()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    sget-object p0, Ll/zzg;->a:Ll/byd0;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ljava/lang/Long;

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 71
    .line 72
    .line 73
    move-result-wide v6

    .line 74
    cmp-long p0, v6, p3

    .line 75
    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    invoke-static {}, Ll/pzi0;->o()J

    .line 79
    .line 80
    .line 81
    move-result-wide p3

    .line 82
    sub-long/2addr p3, v6

    .line 83
    cmp-long p0, p3, p1

    .line 84
    .line 85
    if-gez p0, :cond_2

    .line 86
    .line 87
    invoke-interface {v5}, Ll/x20;->call()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    new-instance p0, Ll/xzg;

    .line 92
    .line 93
    invoke-direct {p0, v3}, Ll/xzg;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_3

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    invoke-virtual {v1}, Ll/o9i;->show()V

    .line 107
    .line 108
    .line 109
    :cond_4
    :goto_0
    return-void
.end method

.method public static g(ZLjava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Ll/wzg;

    .line 4
    .line 5
    invoke-direct {v1, p1, p0}, Ll/wzg;-><init>(Ljava/lang/Throwable;Z)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x12c

    .line 9
    .line 10
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded",
            "ClickableViewAccessibility"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/zzg;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;Ll/uul;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;Ll/uul;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded",
            "ClickableViewAccessibility"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/uul;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/share/a;

    .line 2
    .line 3
    sget v1, Ll/fgc0;->g:I

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    move v3, p3

    .line 11
    move-object v4, p4

    .line 12
    move-object v5, p5

    .line 13
    move-object v6, p6

    .line 14
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->K(Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;Ll/uul;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->show()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
