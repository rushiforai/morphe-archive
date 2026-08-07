.class public Lcom/sina/weibo/sdk/auth/sso/SsoHandler;
.super Lcom/sina/weibo/sdk/auth/BaseSsoHandler;
.source "SourceFile"


# static fields
.field private static final EXTRA_REQUEST_CODE:Ljava/lang/String; = "com.sina.weibo.intent.extra.REQUEST_CODE"

.field private static final REQUEST_CODE_GET_USER_INFO:I = 0x80ce


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/sina/weibo/sdk/auth/BaseSsoHandler;-><init>(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public fillExtraIntent(Landroid/content/Intent;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/sina/weibo/sdk/auth/BaseSsoHandler;->fillExtraIntent(Landroid/content/Intent;I)V

    .line 2
    .line 3
    .line 4
    const p0, 0x80ce

    .line 5
    .line 6
    .line 7
    if-ne p2, p0, :cond_0

    .line 8
    .line 9
    const-string p0, "com.sina.weibo.intent.extra.REQUEST_CODE"

    .line 10
    .line 11
    invoke-virtual {p1, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public resetIntentFillData()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/sina/weibo/sdk/auth/BaseSsoHandler;->resetIntentFillData()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
