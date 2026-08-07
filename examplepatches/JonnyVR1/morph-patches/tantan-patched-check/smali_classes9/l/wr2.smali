.class public Ll/wr2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wr2$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/wr2$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/c050;


# direct methods
.method public constructor <init>()V
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
    iput-object v0, p0, Ll/wr2;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/wr2;->b:Ll/c050;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 15
    .line 16
    invoke-static {v0}, Ll/c050;->e(Landroid/content/Context;)Ll/c050;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/wr2;->b:Ll/c050;

    .line 21
    .line 22
    invoke-static {}, Ll/sz40;->d()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static g(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const-string v0, "suggested.list"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const-string v0, "conversation.single"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v1

    .line 27
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public static h(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const-string v0, "tantanapp://home"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const-string v0, "tantanapp://liveSquare"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    const-string v0, "tantanapp://live"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    const-string v0, "tantanapp://conversations"

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    const-string v0, "tantanapp://moment"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    const-string v0, "tantanapp://profile"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/4 p0, 0x0

    .line 59
    return p0

    .line 60
    :cond_2
    :goto_0
    return v1
.end method


# virtual methods
.method public a(Ll/wr2$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wr2;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/toh0;->g(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-static {}, Ll/toh0;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    const-string p0, "devicepush.list"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Landroid/content/Intent;

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 14
    .line 15
    const-class p2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 16
    .line 17
    invoke-direct {p0, p1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 18
    .line 19
    .line 20
    const-string p1, "android.intent.action.MAIN"

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    const-string p1, "android.intent.category.LAUNCHER"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)Landroid/app/PendingIntent;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p3}, Ll/wr2;->f(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {p0, p2}, Ll/toh0;->e(Landroid/content/Intent;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide p2

    .line 18
    long-to-int p2, p2

    .line 19
    const/high16 p3, 0x4000000

    .line 20
    .line 21
    invoke-static {p1, p2, p0, p3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/bo;->c()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "devicepush.list"

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Ll/wr2;->d(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return-object p0

    .line 44
    :cond_1
    iget-object p0, p0, Ll/wr2;->a:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Ll/wr2$a;

    .line 61
    .line 62
    invoke-interface {v1, p1, p2, v0}, Ll/wr2$a;->a(Lcom/p1/mobile/putong/data/PushMessage;ZLandroid/content/Context;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v2}, Ll/wr2;->g(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    invoke-static {}, Ll/yw0;->c()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-nez v2, :cond_3

    .line 85
    .line 86
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v2, :cond_3

    .line 89
    .line 90
    invoke-static {v2}, Ll/wr2;->h(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-nez v2, :cond_3

    .line 95
    .line 96
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string p1, "extra_from_push_transfer"

    .line 107
    .line 108
    invoke-virtual {p0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 109
    .line 110
    .line 111
    return-object p0

    .line 112
    :cond_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_2

    .line 117
    .line 118
    return-object v1

    .line 119
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/wr2;->j(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/wr2;->k(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)V
    .locals 11
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/wr2;->e(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)Landroid/app/PendingIntent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const-string p2, "call.voiceinviting.single"

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 19
    .line 20
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "conversation.group"

    .line 23
    .line 24
    invoke-static {v1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    const-string p2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVLWVo3Q0lEWk9LVFVHVVJHNktEM1pIVzNEVFJVRiIsInciOjcyMCwiaCI6NzIwLCJkIjowLCJtdCI6ImltYWdlL2pwZWcifQ?format=128x128"

    .line 39
    .line 40
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 41
    .line 42
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-interface {p2, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->z(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    sget p3, Lcom/tantan/core/base/R$string;->b:I

    .line 65
    .line 66
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 71
    .line 72
    move p3, v0

    .line 73
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 74
    .line 75
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-interface {p2, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vq(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_3

    .line 88
    .line 89
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 90
    .line 91
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    sget p3, Lcom/tantan/core/base/R$string;->r:I

    .line 96
    .line 97
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    move v0, p3

    .line 105
    :goto_0
    const-string p2, "conversation.single"

    .line 106
    .line 107
    iget-object p3, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    const-string p3, "push_group_msg"

    .line 114
    .line 115
    const-string v2, "n_id"

    .line 116
    .line 117
    const-class v3, Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;

    .line 118
    .line 119
    const/4 v4, 0x0

    .line 120
    if-nez p2, :cond_4

    .line 121
    .line 122
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-nez p2, :cond_4

    .line 129
    .line 130
    const-string p2, "male.message.repeat"

    .line 131
    .line 132
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    if-nez p2, :cond_4

    .line 139
    .line 140
    const-string p2, "moment.single.comment"

    .line 141
    .line 142
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    if-eqz p2, :cond_5

    .line 149
    .line 150
    :cond_4
    if-eqz v0, :cond_5

    .line 151
    .line 152
    const-string p2, "read"

    .line 153
    .line 154
    invoke-static {p2, v3}, Ll/toh0;->k(Ljava/lang/String;Ljava/lang/Class;)Landroid/content/Intent;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 159
    .line 160
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 161
    .line 162
    const-string v5, "user_id"

    .line 163
    .line 164
    invoke-virtual {p2, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 165
    .line 166
    .line 167
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 168
    .line 169
    invoke-virtual {p2, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 170
    .line 171
    .line 172
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 179
    .line 180
    .line 181
    new-instance v0, Landroidx/core/app/NotificationCompat$Action$Builder;

    .line 182
    .line 183
    sget v6, Ll/cbc0;->u0:I

    .line 184
    .line 185
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 186
    .line 187
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    sget v8, Lcom/tantan/core/base/R$string;->q:I

    .line 192
    .line 193
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 198
    .line 199
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 200
    .line 201
    .line 202
    move-result-wide v9

    .line 203
    long-to-int v9, v9

    .line 204
    const/high16 v10, 0x2000000

    .line 205
    .line 206
    invoke-static {v8, v9, p2, v10}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-direct {v0, v6, v7, p2}, Landroidx/core/app/NotificationCompat$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0}, Landroidx/core/app/NotificationCompat$Action$Builder;->build()Landroidx/core/app/NotificationCompat$Action;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    const-string v0, "OPPO"

    .line 218
    .line 219
    sget-object v6, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_6

    .line 226
    .line 227
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 228
    .line 229
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    sget v4, Lcom/tantan/core/base/R$string;->a:I

    .line 234
    .line 235
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    new-instance v4, Ll/wyc0$d;

    .line 240
    .line 241
    const-string v6, "reply"

    .line 242
    .line 243
    invoke-direct {v4, v6}, Ll/wyc0$d;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v4, v0}, Ll/wyc0$d;->g(Ljava/lang/CharSequence;)Ll/wyc0$d;

    .line 247
    .line 248
    .line 249
    move-result-object v4

    .line 250
    invoke-virtual {v4}, Ll/wyc0$d;->b()Ll/wyc0;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    invoke-static {v6, v3}, Ll/toh0;->k(Ljava/lang/String;Ljava/lang/Class;)Landroid/content/Intent;

    .line 255
    .line 256
    .line 257
    move-result-object v6

    .line 258
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 259
    .line 260
    iget-object v7, v7, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 261
    .line 262
    invoke-virtual {v6, v5, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 263
    .line 264
    .line 265
    iget v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 266
    .line 267
    invoke-virtual {v6, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 268
    .line 269
    .line 270
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 273
    .line 274
    .line 275
    move-result v5

    .line 276
    invoke-virtual {v6, p3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 277
    .line 278
    .line 279
    new-instance v5, Landroidx/core/app/NotificationCompat$Action$Builder;

    .line 280
    .line 281
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 282
    .line 283
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 284
    .line 285
    .line 286
    move-result-wide v8

    .line 287
    long-to-int v8, v8

    .line 288
    invoke-static {v7, v8, v6, v10}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 289
    .line 290
    .line 291
    move-result-object v6

    .line 292
    const v7, 0x1080050

    .line 293
    .line 294
    .line 295
    invoke-direct {v5, v7, v0, v6}, Landroidx/core/app/NotificationCompat$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v5, v4}, Landroidx/core/app/NotificationCompat$Action$Builder;->addRemoteInput(Ll/wyc0;)Landroidx/core/app/NotificationCompat$Action$Builder;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0}, Landroidx/core/app/NotificationCompat$Action$Builder;->build()Landroidx/core/app/NotificationCompat$Action;

    .line 303
    .line 304
    .line 305
    move-result-object v4

    .line 306
    goto :goto_1

    .line 307
    :cond_5
    move-object p2, v4

    .line 308
    :cond_6
    :goto_1
    const-string v0, "dismiss"

    .line 309
    .line 310
    invoke-static {v0, v3}, Ll/toh0;->k(Ljava/lang/String;Ljava/lang/Class;)Landroid/content/Intent;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 315
    .line 316
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 317
    .line 318
    .line 319
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 320
    .line 321
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    invoke-virtual {v0, p3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 326
    .line 327
    .line 328
    invoke-static {p1, p0, v0, v4, p2}, Ll/toh0;->f(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/PendingIntent;Landroid/content/Intent;Landroidx/core/app/NotificationCompat$Action;Landroidx/core/app/NotificationCompat$Action;)V

    .line 329
    .line 330
    .line 331
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->n:Ll/u17;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/u17;->M(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public m(IZ)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->n:Ll/u17;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/u17;->N(IZ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/toh0;->p(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o()Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/toh0;->q()Ljava/util/Collection;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
