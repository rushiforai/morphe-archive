.class public final Lcom/appsflyer/internal/AFc1dSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static t_(Landroid/content/Intent;)Landroid/net/Uri;
    .locals 4
    .param p0    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    new-instance v1, Lcom/appsflyer/internal/AFj1sSDK;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/appsflyer/internal/AFj1sSDK;-><init>(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Lcom/appsflyer/internal/AFj1sSDK$4;

    .line 11
    .line 12
    const-string v2, "android.intent.extra.REFERRER"

    .line 13
    .line 14
    invoke-direct {p0, v1, v2}, Lcom/appsflyer/internal/AFj1sSDK$4;-><init>(Lcom/appsflyer/internal/AFj1sSDK;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v2, "Error while trying to read android.intent.extra.REFERRER extra from intent"

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {v1, p0, v2, v0, v3}, Lcom/appsflyer/internal/AFj1sSDK;->getMediationNetwork(Lkotlin/jvm/functions/Function0;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Landroid/os/Parcelable;

    .line 25
    .line 26
    check-cast p0, Landroid/net/Uri;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    const-string p0, "android.intent.extra.REFERRER_NAME"

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Lcom/appsflyer/internal/AFj1sSDK;->getMonetizationNetwork(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_2
    return-object v0
.end method
