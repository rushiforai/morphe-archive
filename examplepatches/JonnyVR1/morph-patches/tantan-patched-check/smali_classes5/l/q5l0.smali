.class public Ll/q5l0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/kcg0;

.field public static b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Ll/byd0;

.field public static e:Ll/vxd0;

.field public static final f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static g:Ll/byd0;

.field public static h:Ll/vxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/q5l0;->b:Lrx/subjects/b;

    .line 6
    .line 7
    const-string v0, "4200"

    .line 8
    .line 9
    const-string v1, "4300"

    .line 10
    .line 11
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/q5l0;->c:Ljava/util/ArrayList;

    .line 20
    .line 21
    new-instance v0, Ll/byd0;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "LastFPPErrorTime"

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-wide/16 v2, 0x0

    .line 46
    .line 47
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Ll/q5l0;->d:Ll/byd0;

    .line 55
    .line 56
    new-instance v0, Ll/vxd0;

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v3, "fPPErrorCount"

    .line 61
    .line 62
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const/4 v3, 0x0

    .line 81
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    sput-object v0, Ll/q5l0;->e:Ll/vxd0;

    .line 85
    .line 86
    const-string v0, "31100"

    .line 87
    .line 88
    const-string v1, "31200"

    .line 89
    .line 90
    const-string v4, "21100"

    .line 91
    .line 92
    const-string v5, "21200"

    .line 93
    .line 94
    filled-new-array {v4, v5, v0, v1}, [Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    sput-object v0, Ll/q5l0;->f:Ljava/util/ArrayList;

    .line 103
    .line 104
    new-instance v0, Ll/byd0;

    .line 105
    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v4, "LastTxErrorTime"

    .line 109
    .line 110
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 129
    .line 130
    .line 131
    sput-object v0, Ll/q5l0;->g:Ll/byd0;

    .line 132
    .line 133
    new-instance v0, Ll/vxd0;

    .line 134
    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v2, "TxErrorCount"

    .line 138
    .line 139
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 158
    .line 159
    .line 160
    sput-object v0, Ll/q5l0;->h:Ll/vxd0;

    .line 161
    .line 162
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

.method public static synthetic A(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    if-ne p3, v1, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    sget-object p3, Ll/q5l0;->f:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v2, Ll/z4l0;

    .line 9
    .line 10
    invoke-direct {v2, p1}, Ll/z4l0;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p3, v2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_3

    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    sget-object p1, Ll/q5l0;->g:Ll/byd0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ljava/lang/Long;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    const/4 p1, 0x1

    .line 36
    invoke-static {v2, v3, v4, v5, p1}, Ll/tzi0;->h(JJI)Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-eqz p3, :cond_1

    .line 41
    .line 42
    sget-object p0, Ll/q5l0;->h:Ll/vxd0;

    .line 43
    .line 44
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    sget-object p0, Ll/q5l0;->g:Ll/byd0;

    .line 52
    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide p1

    .line 57
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    return v0

    .line 65
    :cond_1
    sget-object p3, Ll/q5l0;->h:Ll/vxd0;

    .line 66
    .line 67
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    check-cast p3, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    if-ge p3, v1, :cond_2

    .line 78
    .line 79
    sget-object p0, Ll/q5l0;->h:Ll/vxd0;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    check-cast p2, Ljava/lang/Integer;

    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    add-int/2addr p2, p1

    .line 92
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    return v0

    .line 100
    :cond_2
    invoke-static {p0, p2}, Ll/q5l0;->L(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return p1

    .line 104
    :cond_3
    return v0
.end method

.method public static E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isCameraSdkLoaded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v0, Ll/a5l0;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/a5l0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/q5l0;->R(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/d0;->n4(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/b5l0;

    .line 14
    .line 15
    invoke-direct {v0, p0, p2}, Ll/b5l0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/c5l0;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/c5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static G(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "verification_video_button"

    .line 2
    .line 3
    const-string v1, "verification_video_agree"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_avatar_verification_video_guide_button"

    .line 14
    .line 15
    const-string v2, "p_avatar_verification_video_guide_popup"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->S3()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/j5l0;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/j5l0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ll/k5l0;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Ll/k5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static H(Lcom/p1/mobile/android/app/Act;Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)Z
    .locals 5

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object v0, p1, Ll/kxf;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p1, Ll/kxf;->g:Ljava/lang/String;

    .line 8
    .line 9
    const-string v2, "2006"

    .line 10
    .line 11
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const-string v3, "1001"

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    const-string v2, "Z5128"

    .line 20
    .line 21
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    :cond_0
    iget-object v2, p1, Ll/kxf;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    iget-object v2, p1, Ll/kxf;->g:Ljava/lang/String;

    .line 36
    .line 37
    const-string v4, "Z5114"

    .line 38
    .line 39
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v2, 0x0

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    :goto_0
    const/4 v2, 0x1

    .line 49
    :goto_1
    if-eqz p2, :cond_e

    .line 50
    .line 51
    iget-boolean p1, p1, Ll/kxf;->h:Z

    .line 52
    .line 53
    if-nez p1, :cond_e

    .line 54
    .line 55
    if-eqz v2, :cond_e

    .line 56
    .line 57
    invoke-static {v3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_a

    .line 62
    .line 63
    const-string p1, "Z1004"

    .line 64
    .line 65
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Jr:I

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    goto/16 :goto_3

    .line 78
    .line 79
    :cond_3
    const-string p1, "Z1005"

    .line 80
    .line 81
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Kr:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    goto/16 :goto_3

    .line 94
    .line 95
    :cond_4
    const-string p1, "Z1006"

    .line 96
    .line 97
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Er:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    goto/16 :goto_3

    .line 110
    .line 111
    :cond_5
    const-string p1, "Z6001"

    .line 112
    .line 113
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_9

    .line 118
    .line 119
    const-string p1, "Z1018"

    .line 120
    .line 121
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-nez p1, :cond_9

    .line 126
    .line 127
    const-string p1, "Z1019"

    .line 128
    .line 129
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-nez p1, :cond_9

    .line 134
    .line 135
    const-string p1, "Z1020"

    .line 136
    .line 137
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_6

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_6
    const-string p1, "Z6002"

    .line 145
    .line 146
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_7

    .line 151
    .line 152
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Fr:I

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    goto :goto_3

    .line 159
    :cond_7
    const-string p1, "Z1024"

    .line 160
    .line 161
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_8

    .line 166
    .line 167
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ir:I

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    goto :goto_3

    .line 174
    :cond_8
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Dr:I

    .line 175
    .line 176
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    goto :goto_3

    .line 181
    :cond_9
    :goto_2
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Cr:I

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    goto :goto_3

    .line 188
    :cond_a
    const-string p1, "2002"

    .line 189
    .line 190
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-eqz p1, :cond_b

    .line 195
    .line 196
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Fr:I

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    goto :goto_3

    .line 203
    :cond_b
    const-string p1, "2003"

    .line 204
    .line 205
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-eqz p1, :cond_c

    .line 210
    .line 211
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Hr:I

    .line 212
    .line 213
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    goto :goto_3

    .line 218
    :cond_c
    const-string p1, "417"

    .line 219
    .line 220
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-eqz p1, :cond_d

    .line 225
    .line 226
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Gr:I

    .line 227
    .line 228
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    goto :goto_3

    .line 233
    :cond_d
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Dr:I

    .line 234
    .line 235
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    :goto_3
    new-instance p3, Ll/jl80$a;

    .line 240
    .line 241
    invoke-direct {p3, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p3, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    sget p3, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 249
    .line 250
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p3

    .line 254
    invoke-virtual {p1, p3}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    new-instance p3, Ll/m5l0;

    .line 259
    .line 260
    invoke-direct {p3, p0}, Ll/m5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p1, p3}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 268
    .line 269
    .line 270
    return p2

    .line 271
    :cond_e
    const-string p1, "fakeBatch"

    .line 272
    .line 273
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    if-eqz p1, :cond_f

    .line 278
    .line 279
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Dr:I

    .line 280
    .line 281
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    new-instance p3, Ll/jl80$a;

    .line 286
    .line 287
    invoke-direct {p3, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p3, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    sget p3, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 295
    .line 296
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p3

    .line 300
    invoke-virtual {p1, p3}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 301
    .line 302
    .line 303
    move-result-object p1

    .line 304
    new-instance p3, Ll/n5l0;

    .line 305
    .line 306
    invoke-direct {p3, p0}, Ll/n5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p1, p3}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 314
    .line 315
    .line 316
    :cond_f
    return p2
.end method

.method public static I(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 v0, 0x3ee

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p1, Ll/jl80$a;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Dr:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget v0, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    packed-switch p1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    const-string p1, "\u7f51\u7edc\u5f02\u5e38"

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    const-string p1, "\u8d26\u53f7\u72b6\u6001\u5f02\u5e38"

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_1
    const-string p1, "\u8d44\u6599\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_2
    const-string p1, "\u5f53\u524d\u5934\u50cf\u4e0d\u771f\u5b9e\uff0c\u8bf7\u4fee\u6539\u540e\u518d\u8bd5"

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    nop

    .line 33
    :pswitch_data_0
    .packed-switch 0x9c4d
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static K(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->gs:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static L(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "p_avatar_verification_video_guide_popup"

    .line 14
    .line 15
    const-string v1, "showManualDialog"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "tooltips_trigger_mode"

    .line 22
    .line 23
    const-string v2, "active"

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    filled-new-array {v1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/jl80$a;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    sget v2, Ll/dbc0;->Ld:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Um:I

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    new-array v4, v3, [Ljava/lang/Object;

    .line 51
    .line 52
    invoke-virtual {v1, v2, v4}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Sm:I

    .line 57
    .line 58
    new-array v3, v3, [Ljava/lang/Object;

    .line 59
    .line 60
    invoke-virtual {v1, v2, v3}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/4 v2, 0x1

    .line 65
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Vm:I

    .line 70
    .line 71
    new-instance v3, Ll/n4l0;

    .line 72
    .line 73
    invoke-direct {v3, p0, p1}, Ll/n4l0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v2, v3}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Tm:I

    .line 81
    .line 82
    new-instance v1, Ll/y4l0;

    .line 83
    .line 84
    invoke-direct {v1}, Ll/y4l0;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p1, v1}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance p1, Ll/i5l0;

    .line 92
    .line 93
    invoke-direct {p1, v0}, Ll/i5l0;-><init>(Ll/l4g0;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 101
    .line 102
    .line 103
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 104
    .line 105
    .line 106
    :cond_0
    return-void
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    goto/16 :goto_2

    .line 5
    .line 6
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 v1, -0x1

    .line 14
    sparse-switch p2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    :goto_0
    move v0, v1

    .line 18
    goto/16 :goto_1

    .line 19
    .line 20
    :sswitch_0
    const-string p2, "3003"

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/16 v0, 0x11

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :sswitch_1
    const-string p2, "3002"

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const/16 v0, 0x10

    .line 43
    .line 44
    goto/16 :goto_1

    .line 45
    .line 46
    :sswitch_2
    const-string p2, "3001"

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/16 v0, 0xf

    .line 56
    .line 57
    goto/16 :goto_1

    .line 58
    .line 59
    :sswitch_3
    const-string p2, "2010"

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    const/16 v0, 0xe

    .line 69
    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :sswitch_4
    const-string p2, "2009"

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    const/16 v0, 0xd

    .line 82
    .line 83
    goto/16 :goto_1

    .line 84
    .line 85
    :sswitch_5
    const-string p2, "2008"

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/16 v0, 0xc

    .line 95
    .line 96
    goto/16 :goto_1

    .line 97
    .line 98
    :sswitch_6
    const-string p2, "2007"

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_7

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    const/16 v0, 0xb

    .line 108
    .line 109
    goto/16 :goto_1

    .line 110
    .line 111
    :sswitch_7
    const-string p2, "2006"

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_8

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    const/16 v0, 0xa

    .line 121
    .line 122
    goto/16 :goto_1

    .line 123
    .line 124
    :sswitch_8
    const-string p2, "2005"

    .line 125
    .line 126
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_9

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_9
    const/16 v0, 0x9

    .line 134
    .line 135
    goto/16 :goto_1

    .line 136
    .line 137
    :sswitch_9
    const-string p2, "2004"

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_a

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_a
    const/16 v0, 0x8

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :sswitch_a
    const-string p2, "2003"

    .line 151
    .line 152
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-nez p1, :cond_b

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_b
    const/4 v0, 0x7

    .line 161
    goto :goto_1

    .line 162
    :sswitch_b
    const-string p2, "2002"

    .line 163
    .line 164
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-nez p1, :cond_c

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_c
    const/4 v0, 0x6

    .line 173
    goto :goto_1

    .line 174
    :sswitch_c
    const-string p2, "2001"

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-nez p1, :cond_d

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :cond_d
    const/4 v0, 0x5

    .line 185
    goto :goto_1

    .line 186
    :sswitch_d
    const-string p2, "1005"

    .line 187
    .line 188
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    if-nez p1, :cond_e

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :cond_e
    const/4 v0, 0x4

    .line 197
    goto :goto_1

    .line 198
    :sswitch_e
    const-string p2, "1004"

    .line 199
    .line 200
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-nez p1, :cond_f

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_f
    const/4 v0, 0x3

    .line 209
    goto :goto_1

    .line 210
    :sswitch_f
    const-string p2, "1003"

    .line 211
    .line 212
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-nez p1, :cond_12

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_10
    const-string p2, "1002"

    .line 221
    .line 222
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-nez p1, :cond_10

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :cond_10
    const/4 v0, 0x1

    .line 231
    goto :goto_1

    .line 232
    :sswitch_11
    const-string p2, "1001"

    .line 233
    .line 234
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    if-nez p1, :cond_11

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :cond_11
    const/4 v0, 0x0

    .line 243
    :cond_12
    :goto_1
    const-string p1, "\u597d\u7684"

    .line 244
    .line 245
    packed-switch v0, :pswitch_data_0

    .line 246
    .line 247
    .line 248
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Bh:I

    .line 249
    .line 250
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 258
    .line 259
    if-eqz p1, :cond_13

    .line 260
    .line 261
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 262
    .line 263
    .line 264
    :cond_13
    :goto_2
    return-void

    .line 265
    :pswitch_0
    new-instance p2, Ll/jl80$a;

    .line 266
    .line 267
    invoke-direct {p2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 268
    .line 269
    .line 270
    const-string v0, "\u64cd\u4f5c\u8d85\u65f6\u5566\uff0c\u518d\u8bd5\u4e00\u6b21\u5427"

    .line 271
    .line 272
    invoke-virtual {p2, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 273
    .line 274
    .line 275
    move-result-object p2

    .line 276
    invoke-virtual {p2, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 277
    .line 278
    .line 279
    move-result-object p2

    .line 280
    invoke-virtual {p2}, Ll/jl80$a;->r0()Ll/jl80;

    .line 281
    .line 282
    .line 283
    :pswitch_1
    new-instance p2, Ll/jl80$a;

    .line 284
    .line 285
    invoke-direct {p2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 286
    .line 287
    .line 288
    const-string v0, "\u8ba4\u8bc1\u9700\u8981\u5bf9\u63a2\u63a2\u5f00\u542f\u76f8\u673a\u548c\u5b58\u50a8\u6743\u9650\u5594\uff0c\u786e\u4fdd\u6743\u9650\u5f00\u542f\u540e\u518d\u8bd5\u8bd5\u5427\u3002\u5982\u4ecd\u7136\u65e0\u6cd5\u8ba4\u8bc1\uff0c\u8bf7\u5728\u300c\u9996\u9875\u5e95\u90e8\u6d88\u606f\u6309\u94ae\u300d-\u300c\u63a2\u63a2\u5c0f\u52a9\u624b\u300d\u4e2d\u53cd\u9988\uff0c\u6211\u4eec\u4f1a\u52a0\u901f\u4e3a\u4f60\u89e3\u51b3"

    .line 289
    .line 290
    invoke-virtual {p2, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 291
    .line 292
    .line 293
    move-result-object p2

    .line 294
    invoke-virtual {p2, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    new-instance p2, Ll/g5l0;

    .line 299
    .line 300
    invoke-direct {p2, p0}, Ll/g5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 308
    .line 309
    .line 310
    return-void

    .line 311
    :pswitch_2
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Fr:I

    .line 312
    .line 313
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    new-instance p2, Ll/jl80$a;

    .line 318
    .line 319
    invoke-direct {p2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p2, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    sget p2, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 327
    .line 328
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object p2

    .line 332
    invoke-virtual {p1, p2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    new-instance p2, Ll/f5l0;

    .line 337
    .line 338
    invoke-direct {p2, p0}, Ll/f5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 342
    .line 343
    .line 344
    move-result-object p0

    .line 345
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :sswitch_data_0
    .sparse-switch
        0x170060 -> :sswitch_11
        0x170061 -> :sswitch_10
        0x170062 -> :sswitch_f
        0x170063 -> :sswitch_e
        0x170064 -> :sswitch_d
        0x1774bf -> :sswitch_c
        0x1774c0 -> :sswitch_b
        0x1774c1 -> :sswitch_a
        0x1774c2 -> :sswitch_9
        0x1774c3 -> :sswitch_8
        0x1774c4 -> :sswitch_7
        0x1774c5 -> :sswitch_6
        0x1774c6 -> :sswitch_5
        0x1774c7 -> :sswitch_4
        0x1774dd -> :sswitch_3
        0x17e91e -> :sswitch_2
        0x17e91f -> :sswitch_1
        0x17e920 -> :sswitch_0
    .end sparse-switch

    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public static N(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
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
    new-instance v11, Ll/h5l0;

    .line 90
    .line 91
    invoke-direct {v11, v1}, Ll/h5l0;-><init>(Ll/l4g0;)V

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

.method public static O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    return-void

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/4 v1, -0x1

    .line 13
    packed-switch p2, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    :goto_0
    move v0, v1

    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :pswitch_0
    const-string p2, "219"

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/16 v0, 0x8

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :pswitch_1
    const-string p2, "218"

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 v0, 0x7

    .line 41
    goto :goto_1

    .line 42
    :pswitch_2
    const-string p2, "217"

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const/4 v0, 0x6

    .line 52
    goto :goto_1

    .line 53
    :pswitch_3
    const-string p2, "216"

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_4

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    const/4 v0, 0x5

    .line 63
    goto :goto_1

    .line 64
    :pswitch_4
    const-string p2, "215"

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_5

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_5
    const/4 v0, 0x4

    .line 74
    goto :goto_1

    .line 75
    :pswitch_5
    const-string p2, "214"

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_6
    const/4 v0, 0x3

    .line 85
    goto :goto_1

    .line 86
    :pswitch_6
    const-string p2, "213"

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_9

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :pswitch_7
    const-string p2, "212"

    .line 96
    .line 97
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_7

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_7
    const/4 v0, 0x1

    .line 105
    goto :goto_1

    .line 106
    :pswitch_8
    const-string p2, "211"

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_8

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_8
    const/4 v0, 0x0

    .line 116
    :cond_9
    :goto_1
    packed-switch v0, :pswitch_data_1

    .line 117
    .line 118
    .line 119
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Bh:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :pswitch_9
    new-instance p1, Ll/jl80$a;

    .line 130
    .line 131
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 132
    .line 133
    .line 134
    const-string p0, "\u8ba4\u8bc1\u9700\u8981\u5bf9\u63a2\u63a2\u5f00\u542f\u76f8\u673a\u548c\u5b58\u50a8\u6743\u9650\u5594\uff0c\u786e\u4fdd\u6743\u9650\u5f00\u542f\u540e\u518d\u8bd5\u8bd5\u5427\u3002\u5982\u4ecd\u7136\u65e0\u6cd5\u8ba4\u8bc1\uff0c\u8bf7\u5728\u300c\u9996\u9875\u5e95\u90e8\u6d88\u606f\u6309\u94ae\u300d-\u300c\u63a2\u63a2\u5c0f\u52a9\u624b\u300d\u4e2d\u53cd\u9988\uff0c\u6211\u4eec\u4f1a\u52a0\u901f\u4e3a\u4f60\u89e3\u51b3"

    .line 135
    .line 136
    invoke-virtual {p1, p0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-string p1, "\u597d\u7684"

    .line 141
    .line 142
    invoke-virtual {p0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :pswitch_a
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Fr:I

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    new-instance p2, Ll/jl80$a;

    .line 157
    .line 158
    invoke-direct {p2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    sget p2, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 166
    .line 167
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {p1, p0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :pswitch_data_0
    .packed-switch 0xc1d2
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public static P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v0, "66660046"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    const/16 v1, 0x32

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_1
    const-string v0, "66660045"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    const/16 v1, 0x31

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_2
    const-string v0, "66660043"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_2
    const/16 v1, 0x30

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :sswitch_3
    const-string v0, "66660042"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :cond_3
    const/16 v1, 0x2f

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :sswitch_4
    const-string v0, "66660041"

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_4
    const/16 v1, 0x2e

    .line 81
    .line 82
    goto/16 :goto_0

    .line 83
    .line 84
    :sswitch_5
    const-string v0, "66660037"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    goto/16 :goto_0

    .line 93
    .line 94
    :cond_5
    const/16 v1, 0x2d

    .line 95
    .line 96
    goto/16 :goto_0

    .line 97
    .line 98
    :sswitch_6
    const-string v0, "66660036"

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    goto/16 :goto_0

    .line 107
    .line 108
    :cond_6
    const/16 v1, 0x2c

    .line 109
    .line 110
    goto/16 :goto_0

    .line 111
    .line 112
    :sswitch_7
    const-string v0, "66660035"

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_7

    .line 119
    .line 120
    goto/16 :goto_0

    .line 121
    .line 122
    :cond_7
    const/16 v1, 0x2b

    .line 123
    .line 124
    goto/16 :goto_0

    .line 125
    .line 126
    :sswitch_8
    const-string v0, "66660033"

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_8

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_8
    const/16 v1, 0x2a

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_9
    const-string v0, "66660025"

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_9

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_9
    const/16 v1, 0x29

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_a
    const-string v0, "66660023"

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-nez p1, :cond_a

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_a
    const/16 v1, 0x28

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_b
    const-string v0, "66660021"

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-nez p1, :cond_b

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :cond_b
    const/16 v1, 0x27

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_c
    const-string v0, "66660017"

    .line 183
    .line 184
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-nez p1, :cond_c

    .line 189
    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :cond_c
    const/16 v1, 0x26

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_d
    const-string v0, "400604"

    .line 197
    .line 198
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    if-nez p1, :cond_d

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :cond_d
    const/16 v1, 0x25

    .line 207
    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_e
    const-string v0, "400506"

    .line 211
    .line 212
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-nez p1, :cond_e

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_e
    const/16 v1, 0x24

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_f
    const-string v0, "400504"

    .line 225
    .line 226
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    if-nez p1, :cond_f

    .line 231
    .line 232
    goto/16 :goto_0

    .line 233
    .line 234
    :cond_f
    const/16 v1, 0x23

    .line 235
    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :sswitch_10
    const-string v0, "400502"

    .line 239
    .line 240
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-nez p1, :cond_10

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :cond_10
    const/16 v1, 0x22

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_11
    const-string v0, "400104"

    .line 253
    .line 254
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    if-nez p1, :cond_11

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :cond_11
    const/16 v1, 0x21

    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :sswitch_12
    const-string v0, "400103"

    .line 267
    .line 268
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-nez p1, :cond_12

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :cond_12
    const/16 v1, 0x20

    .line 277
    .line 278
    goto/16 :goto_0

    .line 279
    .line 280
    :sswitch_13
    const-string v0, "400102"

    .line 281
    .line 282
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result p1

    .line 286
    if-nez p1, :cond_13

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :cond_13
    const/16 v1, 0x1f

    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :sswitch_14
    const-string v0, "400101"

    .line 295
    .line 296
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-nez p1, :cond_14

    .line 301
    .line 302
    goto/16 :goto_0

    .line 303
    .line 304
    :cond_14
    const/16 v1, 0x1e

    .line 305
    .line 306
    goto/16 :goto_0

    .line 307
    .line 308
    :sswitch_15
    const-string v0, "51200"

    .line 309
    .line 310
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    if-nez p1, :cond_15

    .line 315
    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :cond_15
    const/16 v1, 0x1d

    .line 319
    .line 320
    goto/16 :goto_0

    .line 321
    .line 322
    :sswitch_16
    const-string v0, "51100"

    .line 323
    .line 324
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result p1

    .line 328
    if-nez p1, :cond_16

    .line 329
    .line 330
    goto/16 :goto_0

    .line 331
    .line 332
    :cond_16
    const/16 v1, 0x1c

    .line 333
    .line 334
    goto/16 :goto_0

    .line 335
    .line 336
    :sswitch_17
    const-string v0, "41012"

    .line 337
    .line 338
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    move-result p1

    .line 342
    if-nez p1, :cond_17

    .line 343
    .line 344
    goto/16 :goto_0

    .line 345
    .line 346
    :cond_17
    const/16 v1, 0x1b

    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :sswitch_18
    const-string v0, "41010"

    .line 351
    .line 352
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 353
    .line 354
    .line 355
    move-result p1

    .line 356
    if-nez p1, :cond_18

    .line 357
    .line 358
    goto/16 :goto_0

    .line 359
    .line 360
    :cond_18
    const/16 v1, 0x1a

    .line 361
    .line 362
    goto/16 :goto_0

    .line 363
    .line 364
    :sswitch_19
    const-string v0, "41009"

    .line 365
    .line 366
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    move-result p1

    .line 370
    if-nez p1, :cond_19

    .line 371
    .line 372
    goto/16 :goto_0

    .line 373
    .line 374
    :cond_19
    const/16 v1, 0x19

    .line 375
    .line 376
    goto/16 :goto_0

    .line 377
    .line 378
    :sswitch_1a
    const-string v0, "41008"

    .line 379
    .line 380
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    move-result p1

    .line 384
    if-nez p1, :cond_1a

    .line 385
    .line 386
    goto/16 :goto_0

    .line 387
    .line 388
    :cond_1a
    const/16 v1, 0x18

    .line 389
    .line 390
    goto/16 :goto_0

    .line 391
    .line 392
    :sswitch_1b
    const-string v0, "41007"

    .line 393
    .line 394
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    move-result p1

    .line 398
    if-nez p1, :cond_1b

    .line 399
    .line 400
    goto/16 :goto_0

    .line 401
    .line 402
    :cond_1b
    const/16 v1, 0x17

    .line 403
    .line 404
    goto/16 :goto_0

    .line 405
    .line 406
    :sswitch_1c
    const-string v0, "41006"

    .line 407
    .line 408
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    if-nez p1, :cond_1c

    .line 413
    .line 414
    goto/16 :goto_0

    .line 415
    .line 416
    :cond_1c
    const/16 v1, 0x16

    .line 417
    .line 418
    goto/16 :goto_0

    .line 419
    .line 420
    :sswitch_1d
    const-string v0, "41005"

    .line 421
    .line 422
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    move-result p1

    .line 426
    if-nez p1, :cond_1d

    .line 427
    .line 428
    goto/16 :goto_0

    .line 429
    .line 430
    :cond_1d
    const/16 v1, 0x15

    .line 431
    .line 432
    goto/16 :goto_0

    .line 433
    .line 434
    :sswitch_1e
    const-string v0, "41004"

    .line 435
    .line 436
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result p1

    .line 440
    if-nez p1, :cond_1e

    .line 441
    .line 442
    goto/16 :goto_0

    .line 443
    .line 444
    :cond_1e
    const/16 v1, 0x14

    .line 445
    .line 446
    goto/16 :goto_0

    .line 447
    .line 448
    :sswitch_1f
    const-string v0, "41003"

    .line 449
    .line 450
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    move-result p1

    .line 454
    if-nez p1, :cond_1f

    .line 455
    .line 456
    goto/16 :goto_0

    .line 457
    .line 458
    :cond_1f
    const/16 v1, 0x13

    .line 459
    .line 460
    goto/16 :goto_0

    .line 461
    .line 462
    :sswitch_20
    const-string v0, "41002"

    .line 463
    .line 464
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 465
    .line 466
    .line 467
    move-result p1

    .line 468
    if-nez p1, :cond_20

    .line 469
    .line 470
    goto/16 :goto_0

    .line 471
    .line 472
    :cond_20
    const/16 v1, 0x12

    .line 473
    .line 474
    goto/16 :goto_0

    .line 475
    .line 476
    :sswitch_21
    const-string v0, "31200"

    .line 477
    .line 478
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 479
    .line 480
    .line 481
    move-result p1

    .line 482
    if-nez p1, :cond_21

    .line 483
    .line 484
    goto/16 :goto_0

    .line 485
    .line 486
    :cond_21
    const/16 v1, 0x11

    .line 487
    .line 488
    goto/16 :goto_0

    .line 489
    .line 490
    :sswitch_22
    const-string v0, "31100"

    .line 491
    .line 492
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 493
    .line 494
    .line 495
    move-result p1

    .line 496
    if-nez p1, :cond_22

    .line 497
    .line 498
    goto/16 :goto_0

    .line 499
    .line 500
    :cond_22
    const/16 v1, 0x10

    .line 501
    .line 502
    goto/16 :goto_0

    .line 503
    .line 504
    :sswitch_23
    const-string v0, "21200"

    .line 505
    .line 506
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    move-result p1

    .line 510
    if-nez p1, :cond_23

    .line 511
    .line 512
    goto/16 :goto_0

    .line 513
    .line 514
    :cond_23
    const/16 v1, 0xf

    .line 515
    .line 516
    goto/16 :goto_0

    .line 517
    .line 518
    :sswitch_24
    const-string v0, "21100"

    .line 519
    .line 520
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 521
    .line 522
    .line 523
    move-result p1

    .line 524
    if-nez p1, :cond_24

    .line 525
    .line 526
    goto/16 :goto_0

    .line 527
    .line 528
    :cond_24
    const/16 v1, 0xe

    .line 529
    .line 530
    goto/16 :goto_0

    .line 531
    .line 532
    :sswitch_25
    const-string v0, "11007"

    .line 533
    .line 534
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 535
    .line 536
    .line 537
    move-result p1

    .line 538
    if-nez p1, :cond_25

    .line 539
    .line 540
    goto/16 :goto_0

    .line 541
    .line 542
    :cond_25
    const/16 v1, 0xd

    .line 543
    .line 544
    goto/16 :goto_0

    .line 545
    .line 546
    :sswitch_26
    const-string v0, "11006"

    .line 547
    .line 548
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 549
    .line 550
    .line 551
    move-result p1

    .line 552
    if-nez p1, :cond_26

    .line 553
    .line 554
    goto/16 :goto_0

    .line 555
    .line 556
    :cond_26
    const/16 v1, 0xc

    .line 557
    .line 558
    goto/16 :goto_0

    .line 559
    .line 560
    :sswitch_27
    const-string v0, "11005"

    .line 561
    .line 562
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 563
    .line 564
    .line 565
    move-result p1

    .line 566
    if-nez p1, :cond_27

    .line 567
    .line 568
    goto/16 :goto_0

    .line 569
    .line 570
    :cond_27
    const/16 v1, 0xb

    .line 571
    .line 572
    goto/16 :goto_0

    .line 573
    .line 574
    :sswitch_28
    const-string v0, "11004"

    .line 575
    .line 576
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 577
    .line 578
    .line 579
    move-result p1

    .line 580
    if-nez p1, :cond_28

    .line 581
    .line 582
    goto/16 :goto_0

    .line 583
    .line 584
    :cond_28
    const/16 v1, 0xa

    .line 585
    .line 586
    goto/16 :goto_0

    .line 587
    .line 588
    :sswitch_29
    const-string v0, "11003"

    .line 589
    .line 590
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 591
    .line 592
    .line 593
    move-result p1

    .line 594
    if-nez p1, :cond_29

    .line 595
    .line 596
    goto/16 :goto_0

    .line 597
    .line 598
    :cond_29
    const/16 v1, 0x9

    .line 599
    .line 600
    goto/16 :goto_0

    .line 601
    .line 602
    :sswitch_2a
    const-string v0, "-5027"

    .line 603
    .line 604
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 605
    .line 606
    .line 607
    move-result p1

    .line 608
    if-nez p1, :cond_2a

    .line 609
    .line 610
    goto/16 :goto_0

    .line 611
    .line 612
    :cond_2a
    const/16 v1, 0x8

    .line 613
    .line 614
    goto/16 :goto_0

    .line 615
    .line 616
    :sswitch_2b
    const-string v0, "-5025"

    .line 617
    .line 618
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 619
    .line 620
    .line 621
    move-result p1

    .line 622
    if-nez p1, :cond_2b

    .line 623
    .line 624
    goto :goto_0

    .line 625
    :cond_2b
    const/4 v1, 0x7

    .line 626
    goto :goto_0

    .line 627
    :sswitch_2c
    const-string v0, "-5020"

    .line 628
    .line 629
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 630
    .line 631
    .line 632
    move-result p1

    .line 633
    if-nez p1, :cond_2c

    .line 634
    .line 635
    goto :goto_0

    .line 636
    :cond_2c
    const/4 v1, 0x6

    .line 637
    goto :goto_0

    .line 638
    :sswitch_2d
    const-string v0, "-5011"

    .line 639
    .line 640
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 641
    .line 642
    .line 643
    move-result p1

    .line 644
    if-nez p1, :cond_2d

    .line 645
    .line 646
    goto :goto_0

    .line 647
    :cond_2d
    const/4 v1, 0x5

    .line 648
    goto :goto_0

    .line 649
    :sswitch_2e
    const-string v0, "-5009"

    .line 650
    .line 651
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 652
    .line 653
    .line 654
    move-result p1

    .line 655
    if-nez p1, :cond_2e

    .line 656
    .line 657
    goto :goto_0

    .line 658
    :cond_2e
    const/4 v1, 0x4

    .line 659
    goto :goto_0

    .line 660
    :sswitch_2f
    const-string v0, "-5005"

    .line 661
    .line 662
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 663
    .line 664
    .line 665
    move-result p1

    .line 666
    if-nez p1, :cond_2f

    .line 667
    .line 668
    goto :goto_0

    .line 669
    :cond_2f
    const/4 v1, 0x3

    .line 670
    goto :goto_0

    .line 671
    :sswitch_30
    const-string v0, "-5001"

    .line 672
    .line 673
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 674
    .line 675
    .line 676
    move-result p1

    .line 677
    if-nez p1, :cond_30

    .line 678
    .line 679
    goto :goto_0

    .line 680
    :cond_30
    const/4 v1, 0x2

    .line 681
    goto :goto_0

    .line 682
    :sswitch_31
    const-string v0, "-1404"

    .line 683
    .line 684
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    move-result p1

    .line 688
    if-nez p1, :cond_31

    .line 689
    .line 690
    goto :goto_0

    .line 691
    :cond_31
    const/4 v1, 0x1

    .line 692
    goto :goto_0

    .line 693
    :sswitch_32
    const-string v0, "-1102"

    .line 694
    .line 695
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 696
    .line 697
    .line 698
    move-result p1

    .line 699
    if-nez p1, :cond_32

    .line 700
    .line 701
    goto :goto_0

    .line 702
    :cond_32
    const/4 v1, 0x0

    .line 703
    :goto_0
    const-string p1, "\u597d\u7684"

    .line 704
    .line 705
    packed-switch v1, :pswitch_data_0

    .line 706
    .line 707
    .line 708
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Bh:I

    .line 709
    .line 710
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 711
    .line 712
    .line 713
    move-result-object p1

    .line 714
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 715
    .line 716
    .line 717
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 718
    .line 719
    if-eqz p1, :cond_33

    .line 720
    .line 721
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 722
    .line 723
    .line 724
    return-void

    .line 725
    :pswitch_0
    const-string p1, "\u9a8c\u8bc1\u6b21\u6570\u8fc7\u591a\uff0c\u8bf724\u5c0f\u65f6\u540e\u518d\u8bd5"

    .line 726
    .line 727
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 728
    .line 729
    .line 730
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 731
    .line 732
    if-eqz p1, :cond_33

    .line 733
    .line 734
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 735
    .line 736
    .line 737
    :cond_33
    return-void

    .line 738
    :pswitch_1
    new-instance v0, Ll/jl80$a;

    .line 739
    .line 740
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 741
    .line 742
    .line 743
    const-string v1, "\u64cd\u4f5c\u8fc7\u4e8e\u9891\u7e41\uff0c\u7a0d\u7b495\u5206\u949f\u518d\u8bd5\u8bd5\u5427\u3002\u5982\u4ecd\u7136\u65e0\u6cd5\u8ba4\u8bc1\uff0c\u8bf7\u5728\u300c\u9996\u9875\u5e95\u90e8\u6d88\u606f\u6309\u94ae\u300d-\u300c\u63a2\u63a2\u5c0f\u52a9\u624b\u300d\u4e2d\u53cd\u9988\uff0c\u6211\u4eec\u4f1a\u52a0\u901f\u4e3a\u4f60\u89e3\u51b3"

    .line 744
    .line 745
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 746
    .line 747
    .line 748
    move-result-object v0

    .line 749
    invoke-virtual {v0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 750
    .line 751
    .line 752
    move-result-object p1

    .line 753
    new-instance v0, Ll/u4l0;

    .line 754
    .line 755
    invoke-direct {v0, p0}, Ll/u4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 756
    .line 757
    .line 758
    invoke-virtual {p1, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 759
    .line 760
    .line 761
    move-result-object p0

    .line 762
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 763
    .line 764
    .line 765
    return-void

    .line 766
    :pswitch_2
    new-instance v0, Ll/jl80$a;

    .line 767
    .line 768
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 769
    .line 770
    .line 771
    const-string v1, "\u64cd\u4f5c\u8d85\u65f6\u5566\uff0c\u518d\u8bd5\u4e00\u6b21\u5427"

    .line 772
    .line 773
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 774
    .line 775
    .line 776
    move-result-object v0

    .line 777
    invoke-virtual {v0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 778
    .line 779
    .line 780
    move-result-object p1

    .line 781
    new-instance v0, Ll/t4l0;

    .line 782
    .line 783
    invoke-direct {v0, p0}, Ll/t4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 784
    .line 785
    .line 786
    invoke-virtual {p1, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 787
    .line 788
    .line 789
    move-result-object p0

    .line 790
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 791
    .line 792
    .line 793
    return-void

    .line 794
    :pswitch_3
    new-instance v0, Ll/jl80$a;

    .line 795
    .line 796
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 797
    .line 798
    .line 799
    const-string v1, "\u8ba4\u8bc1\u9700\u8981\u5bf9\u63a2\u63a2\u5f00\u542f\u76f8\u673a\u548c\u5b58\u50a8\u6743\u9650\u5594\uff0c\u786e\u4fdd\u6743\u9650\u5f00\u542f\u540e\u518d\u8bd5\u8bd5\u5427\u3002\u5982\u4ecd\u7136\u65e0\u6cd5\u8ba4\u8bc1\uff0c\u8bf7\u5728\u300c\u9996\u9875\u5e95\u90e8\u6d88\u606f\u6309\u94ae\u300d-\u300c\u63a2\u63a2\u5c0f\u52a9\u624b\u300d\u4e2d\u53cd\u9988\uff0c\u6211\u4eec\u4f1a\u52a0\u901f\u4e3a\u4f60\u89e3\u51b3"

    .line 800
    .line 801
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 802
    .line 803
    .line 804
    move-result-object v0

    .line 805
    invoke-virtual {v0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 806
    .line 807
    .line 808
    move-result-object p1

    .line 809
    new-instance v0, Ll/r4l0;

    .line 810
    .line 811
    invoke-direct {v0, p0}, Ll/r4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 812
    .line 813
    .line 814
    invoke-virtual {p1, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 815
    .line 816
    .line 817
    move-result-object p0

    .line 818
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 819
    .line 820
    .line 821
    return-void

    .line 822
    :pswitch_4
    new-instance v0, Ll/jl80$a;

    .line 823
    .line 824
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 825
    .line 826
    .line 827
    const-string v1, "\u7f51\u7edc\u5f02\u5e38\u5566\uff0c\u8bf7\u786e\u4fdd\u624b\u673a\u7f51\u7edc\u3001\u7cfb\u7edf\u65f6\u95f4\u8bbe\u7f6e\u5747\u6b63\u5e38\u540e\u91cd\u542fAPP\u518d\u8bd5\u8bd5\u5427\u3002\u5982\u4ecd\u7136\u65e0\u6cd5\u8ba4\u8bc1\uff0c\u8bf7\u5728\u300c\u9996\u9875\u5e95\u90e8\u6d88\u606f\u6309\u94ae\u300d-\u300c\u63a2\u63a2\u5c0f\u52a9\u624b\u300d\u4e2d\u53cd\u9988\uff0c\u6211\u4eec\u4f1a\u52a0\u901f\u4e3a\u4f60\u89e3\u51b3"

    .line 828
    .line 829
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 830
    .line 831
    .line 832
    move-result-object v0

    .line 833
    invoke-virtual {v0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 834
    .line 835
    .line 836
    move-result-object p1

    .line 837
    new-instance v0, Ll/q4l0;

    .line 838
    .line 839
    invoke-direct {v0, p0}, Ll/q4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 840
    .line 841
    .line 842
    invoke-virtual {p1, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 843
    .line 844
    .line 845
    move-result-object p0

    .line 846
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 847
    .line 848
    .line 849
    return-void

    .line 850
    :pswitch_5
    new-instance v0, Ll/jl80$a;

    .line 851
    .line 852
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 853
    .line 854
    .line 855
    const-string v1, "\u5237\u8138\u65f6\u9700\u8981\u6f0f\u51fa\u4f60\u7684\u5b8c\u6574\u3001\u6e05\u6670\u9762\u90e8\u624d\u80fd\u901a\u8fc7\u8ba4\u8bc1\u5594\u3002\u5982\u4ecd\u7136\u65e0\u6cd5\u8ba4\u8bc1\uff0c\u8bf7\u5728\u300c\u9996\u9875\u5e95\u90e8\u6d88\u606f\u6309\u94ae\u300d-\u300c\u63a2\u63a2\u5c0f\u52a9\u624b\u300d\u4e2d\u53cd\u9988\uff0c\u6211\u4eec\u4f1a\u52a0\u901f\u4e3a\u4f60\u89e3\u51b3"

    .line 856
    .line 857
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 858
    .line 859
    .line 860
    move-result-object v0

    .line 861
    invoke-virtual {v0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 862
    .line 863
    .line 864
    move-result-object p1

    .line 865
    new-instance v0, Ll/s4l0;

    .line 866
    .line 867
    invoke-direct {v0, p0}, Ll/s4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 868
    .line 869
    .line 870
    invoke-virtual {p1, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 871
    .line 872
    .line 873
    move-result-object p0

    .line 874
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 875
    .line 876
    .line 877
    return-void

    .line 878
    nop

    .line 879
    :sswitch_data_0
    .sparse-switch
        0x29125cf -> :sswitch_32
        0x2913114 -> :sswitch_31
        0x292f389 -> :sswitch_30
        0x292f38d -> :sswitch_2f
        0x292f391 -> :sswitch_2e
        0x292f3a8 -> :sswitch_2d
        0x292f3c6 -> :sswitch_2c
        0x292f3cb -> :sswitch_2b
        0x292f3cd -> :sswitch_2a
        0x2c98013 -> :sswitch_29
        0x2c98014 -> :sswitch_28
        0x2c98015 -> :sswitch_27
        0x2c98016 -> :sswitch_26
        0x2c98017 -> :sswitch_25
        0x2d79b52 -> :sswitch_24
        0x2d79f13 -> :sswitch_23
        0x2e5b2d3 -> :sswitch_22
        0x2e5b694 -> :sswitch_21
        0x2f3c695 -> :sswitch_20
        0x2f3c696 -> :sswitch_1f
        0x2f3c697 -> :sswitch_1e
        0x2f3c698 -> :sswitch_1d
        0x2f3c699 -> :sswitch_1c
        0x2f3c69a -> :sswitch_1b
        0x2f3c69b -> :sswitch_1a
        0x2f3c69c -> :sswitch_19
        0x2f3c6b2 -> :sswitch_18
        0x2f3c6b4 -> :sswitch_17
        0x301e1d5 -> :sswitch_16
        0x301e596 -> :sswitch_15
        0x5b76f83e -> :sswitch_14
        0x5b76f83f -> :sswitch_13
        0x5b76f840 -> :sswitch_12
        0x5b76f841 -> :sswitch_11
        0x5b770743 -> :sswitch_10
        0x5b770745 -> :sswitch_f
        0x5b770747 -> :sswitch_e
        0x5b770b06 -> :sswitch_d
        0x714529a6 -> :sswitch_c
        0x714529bf -> :sswitch_b
        0x714529c1 -> :sswitch_a
        0x714529c3 -> :sswitch_9
        0x714529e0 -> :sswitch_8
        0x714529e2 -> :sswitch_7
        0x714529e3 -> :sswitch_6
        0x714529e4 -> :sswitch_5
        0x714529fd -> :sswitch_4
        0x714529fe -> :sswitch_3
        0x714529ff -> :sswitch_2
        0x71452a01 -> :sswitch_1
        0x71452a02 -> :sswitch_0
    .end sparse-switch

    .line 880
    .line 881
    .line 882
    .line 883
    .line 884
    .line 885
    .line 886
    .line 887
    .line 888
    .line 889
    .line 890
    .line 891
    .line 892
    .line 893
    .line 894
    .line 895
    .line 896
    .line 897
    .line 898
    .line 899
    .line 900
    .line 901
    .line 902
    .line 903
    .line 904
    .line 905
    .line 906
    .line 907
    .line 908
    .line 909
    .line 910
    .line 911
    .line 912
    .line 913
    .line 914
    .line 915
    .line 916
    .line 917
    .line 918
    .line 919
    .line 920
    .line 921
    .line 922
    .line 923
    .line 924
    .line 925
    .line 926
    .line 927
    .line 928
    .line 929
    .line 930
    .line 931
    .line 932
    .line 933
    .line 934
    .line 935
    .line 936
    .line 937
    .line 938
    .line 939
    .line 940
    .line 941
    .line 942
    .line 943
    .line 944
    .line 945
    .line 946
    .line 947
    .line 948
    .line 949
    .line 950
    .line 951
    .line 952
    .line 953
    .line 954
    .line 955
    .line 956
    .line 957
    .line 958
    .line 959
    .line 960
    .line 961
    .line 962
    .line 963
    .line 964
    .line 965
    .line 966
    .line 967
    .line 968
    .line 969
    .line 970
    .line 971
    .line 972
    .line 973
    .line 974
    .line 975
    .line 976
    .line 977
    .line 978
    .line 979
    .line 980
    .line 981
    .line 982
    .line 983
    .line 984
    .line 985
    .line 986
    .line 987
    .line 988
    .line 989
    .line 990
    .line 991
    .line 992
    .line 993
    .line 994
    .line 995
    .line 996
    .line 997
    .line 998
    .line 999
    .line 1000
    .line 1001
    .line 1002
    .line 1003
    .line 1004
    .line 1005
    .line 1006
    .line 1007
    .line 1008
    .line 1009
    .line 1010
    .line 1011
    .line 1012
    .line 1013
    .line 1014
    .line 1015
    .line 1016
    .line 1017
    .line 1018
    .line 1019
    .line 1020
    .line 1021
    .line 1022
    .line 1023
    .line 1024
    .line 1025
    .line 1026
    .line 1027
    .line 1028
    .line 1029
    .line 1030
    .line 1031
    .line 1032
    .line 1033
    .line 1034
    .line 1035
    .line 1036
    .line 1037
    .line 1038
    .line 1039
    .line 1040
    .line 1041
    .line 1042
    .line 1043
    .line 1044
    .line 1045
    .line 1046
    .line 1047
    .line 1048
    .line 1049
    .line 1050
    .line 1051
    .line 1052
    .line 1053
    .line 1054
    .line 1055
    .line 1056
    .line 1057
    .line 1058
    .line 1059
    .line 1060
    .line 1061
    .line 1062
    .line 1063
    .line 1064
    .line 1065
    .line 1066
    .line 1067
    .line 1068
    .line 1069
    .line 1070
    .line 1071
    .line 1072
    .line 1073
    .line 1074
    .line 1075
    .line 1076
    .line 1077
    .line 1078
    .line 1079
    .line 1080
    .line 1081
    .line 1082
    .line 1083
    .line 1084
    .line 1085
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_2
        :pswitch_5
        :pswitch_4
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public static Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 p2, -0x3ee

    .line 6
    .line 7
    if-eq p1, p2, :cond_5

    .line 8
    .line 9
    const/16 p2, -0x3ef

    .line 10
    .line 11
    if-ne p1, p2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const/16 p2, -0xbbb

    .line 16
    .line 17
    if-eq p1, p2, :cond_4

    .line 18
    .line 19
    const/16 p2, -0xbb9

    .line 20
    .line 21
    if-eq p1, p2, :cond_3

    .line 22
    .line 23
    const/16 p2, -0x3eb

    .line 24
    .line 25
    if-eq p1, p2, :cond_2

    .line 26
    .line 27
    const/16 p2, -0x3e8

    .line 28
    .line 29
    if-eq p1, p2, :cond_3

    .line 30
    .line 31
    const p2, 0x186a6

    .line 32
    .line 33
    .line 34
    if-eq p1, p2, :cond_1

    .line 35
    .line 36
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Bh:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 46
    .line 47
    if-eqz p1, :cond_5

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    new-instance p1, Ll/jl80$a;

    .line 54
    .line 55
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Hr:I

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p1, p2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    sget p2, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 69
    .line 70
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p1, p2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance p2, Ll/o5l0;

    .line 79
    .line 80
    invoke-direct {p2, p0}, Ll/o5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    new-instance p1, Ll/jl80$a;

    .line 92
    .line 93
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Er:I

    .line 97
    .line 98
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p1, p2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget p2, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 107
    .line 108
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-virtual {p1, p2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    new-instance p2, Ll/o4l0;

    .line 117
    .line 118
    invoke-direct {p2, p0}, Ll/o4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_3
    new-instance p1, Ll/jl80$a;

    .line 130
    .line 131
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 132
    .line 133
    .line 134
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Fr:I

    .line 135
    .line 136
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p1, p2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    sget p2, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 145
    .line 146
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-virtual {p1, p2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    new-instance p2, Ll/p5l0;

    .line 155
    .line 156
    invoke-direct {p2, p0}, Ll/p5l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_4
    new-instance p1, Ll/jl80$a;

    .line 168
    .line 169
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 170
    .line 171
    .line 172
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Cr:I

    .line 173
    .line 174
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-virtual {p1, p2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    sget p2, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 183
    .line 184
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-virtual {p1, p2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    new-instance p2, Ll/p4l0;

    .line 193
    .line 194
    invoke-direct {p2, p0}, Ll/p4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 202
    .line 203
    .line 204
    :cond_5
    :goto_0
    return-void
.end method

.method public static R(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 9
    .line 10
    filled-new-array {v0}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    filled-new-array {v0}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v2, Ll/d5l0;

    .line 33
    .line 34
    invoke-direct {v2, p0, p1}, Ll/d5l0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    const-string v0, ""

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 70
    .line 71
    .line 72
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cameraSdkLoaded()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance v1, Ll/e5l0;

    .line 85
    .line 86
    invoke-direct {v1, v0, p1}, Ll/e5l0;-><init>(Landroid/app/Dialog;Ll/x20;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/q5l0;->E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ll/q5l0;->a:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    sget-object p1, Ll/q5l0;->a:Ll/kcg0;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p1, Ll/q5l0;->b:Lrx/subjects/b;

    .line 20
    .line 21
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/v4l0;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Ll/v4l0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sput-object p1, Ll/q5l0;->a:Ll/kcg0;

    .line 39
    .line 40
    new-instance p1, Ll/w4l0;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/w4l0;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance p2, Ll/x4l0;

    .line 46
    .line 47
    invoke-direct {p2}, Ll/x4l0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q5l0;->R(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q5l0;->G(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic i(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x4

    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/wzx;->k()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const-string v2, "android.permission.RECORD_AUDIO"

    .line 32
    .line 33
    const-string v3, "android.permission.CAMERA"

    .line 34
    .line 35
    const/4 v4, 0x2

    .line 36
    const/4 v5, 0x1

    .line 37
    const/4 v6, 0x0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    new-array v0, v4, [Ljava/lang/String;

    .line 41
    .line 42
    aput-object v3, v0, v6

    .line 43
    .line 44
    aput-object v2, v0, v5

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-array v0, v1, [Ljava/lang/String;

    .line 48
    .line 49
    aput-object v3, v0, v6

    .line 50
    .line 51
    aput-object v2, v0, v5

    .line 52
    .line 53
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 54
    .line 55
    aput-object v1, v0, v4

    .line 56
    .line 57
    const/4 v1, 0x3

    .line 58
    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 59
    .line 60
    aput-object v2, v0, v1

    .line 61
    .line 62
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/l5l0;

    .line 79
    .line 80
    invoke-direct {v1, p0, p2, p1}, Ll/l5l0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 92
    .line 93
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic o()V
    .locals 1

    .line 1
    sget-object v0, Ll/q5l0;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/q5l0;->N(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
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
    invoke-static {p0, p2, p1}, Ll/q5l0;->F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ks:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ks:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic u(Landroid/app/Dialog;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic w()V
    .locals 3

    .line 1
    const-string v0, "verification_video_button"

    .line 2
    .line 3
    const-string v1, "verification_video_refuse"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_avatar_verification_video_guide_button"

    .line 14
    .line 15
    const-string v2, "p_avatar_verification_video_guide_popup"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic z(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
