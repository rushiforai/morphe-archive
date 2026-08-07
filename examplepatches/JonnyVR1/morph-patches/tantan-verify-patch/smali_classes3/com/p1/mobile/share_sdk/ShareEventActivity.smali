.class public Lcom/p1/mobile/share_sdk/ShareEventActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# static fields
.field public static final PLATFORM:Ljava/lang/String; = "platform"

.field public static final SHARE_DATA:Ljava/lang/String; = "share_data"


# instance fields
.field platform:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x2777

    .line 5
    .line 6
    if-eq p1, v0, :cond_3

    .line 7
    .line 8
    const/16 v0, 0x2778

    .line 9
    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object p1, Ll/fqf0;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_4

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    if-nez p3, :cond_1

    .line 25
    .line 26
    new-instance p2, Ll/j5f$e;

    .line 27
    .line 28
    const/4 p3, 0x2

    .line 29
    invoke-direct {p2, p3, p1}, Ll/j5f$e;-><init>(ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2}, Ll/j5f;->c(Ll/j5f$e;)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    const-string p2, "_weibo_resp_errcode"

    .line 37
    .line 38
    const/16 v0, -0x1f

    .line 39
    .line 40
    invoke-virtual {p3, p2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-ne p2, v0, :cond_2

    .line 45
    .line 46
    new-instance p2, Ll/j5f$e;

    .line 47
    .line 48
    const/4 p3, 0x1

    .line 49
    invoke-direct {p2, p3, p1}, Ll/j5f$e;-><init>(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p2}, Ll/j5f;->c(Ll/j5f$e;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    new-instance p1, Lcom/sina/weibo/sdk/share/WbShareHandler;

    .line 57
    .line 58
    invoke-direct {p1, p0}, Lcom/sina/weibo/sdk/share/WbShareHandler;-><init>(Landroid/app/Activity;)V

    .line 59
    .line 60
    .line 61
    sget-object p2, Ll/j5f;->c:Lcom/sina/weibo/sdk/share/WbShareCallback;

    .line 62
    .line 63
    invoke-virtual {p1, p3, p2}, Lcom/sina/weibo/sdk/share/WbShareHandler;->doResultIntent(Landroid/content/Intent;Lcom/sina/weibo/sdk/share/WbShareCallback;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    :goto_0
    sget-object v0, Ll/j5f;->e:Lcom/tencent/tauth/IUiListener;

    .line 68
    .line 69
    invoke-static {p1, p2, p3, v0}, Lcom/tencent/tauth/Tencent;->onActivityResultData(IILandroid/content/Intent;Lcom/tencent/tauth/IUiListener;)Z

    .line 70
    .line 71
    .line 72
    :cond_4
    :goto_1
    sget-object p1, Ll/hvb0;->b:Ljava/lang/String;

    .line 73
    .line 74
    iget-object p2, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_5

    .line 81
    .line 82
    new-instance p1, Landroid/os/Handler;

    .line 83
    .line 84
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 89
    .line 90
    .line 91
    new-instance p2, Lcom/p1/mobile/share_sdk/ShareEventActivity$b;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Lcom/p1/mobile/share_sdk/ShareEventActivity$b;-><init>(Lcom/p1/mobile/share_sdk/ShareEventActivity;)V

    .line 94
    .line 95
    .line 96
    const-wide/16 v0, 0x320

    .line 97
    .line 98
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_5
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v0, 0x1a

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const p1, 0x1020002

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Lcom/p1/mobile/share_sdk/ShareEventActivity$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/p1/mobile/share_sdk/ShareEventActivity$a;-><init>(Lcom/p1/mobile/share_sdk/ShareEventActivity;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "platform"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const-string v1, "share_data"

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 50
    .line 51
    sget-object v2, Ll/hvb0;->b:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 60
    .line 61
    sget-object v2, Ll/gvb0;->b:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/p1/mobile/share_sdk/content/Content;

    .line 76
    .line 77
    invoke-static {v0, p0, p1}, Ll/fvb0;->l(Ljava/lang/String;Landroid/app/Activity;Lcom/p1/mobile/share_sdk/content/Content;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 82
    .line 83
    sget-object v2, Ll/fqf0;->b:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    invoke-static {p0}, Lcom/sina/weibo/sdk/WbSdk;->isWbInstall(Landroid/content/Context;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/share_sdk/content/Content;

    .line 102
    .line 103
    invoke-static {p0, p1}, Ll/owp0;->j(Landroid/app/Activity;Lcom/p1/mobile/share_sdk/content/Content;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_4
    invoke-static {p0}, Ll/jvp0;->g(Landroid/content/Context;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget-object v0, Ll/j5f;->d:Lcom/tencent/mm/opensdk/openapi/IWXAPIEventHandler;

    .line 116
    .line 117
    invoke-interface {p0, p1, v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->handleIntent(Landroid/content/Intent;Lcom/tencent/mm/opensdk/openapi/IWXAPIEventHandler;)Z

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity;->platform:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
