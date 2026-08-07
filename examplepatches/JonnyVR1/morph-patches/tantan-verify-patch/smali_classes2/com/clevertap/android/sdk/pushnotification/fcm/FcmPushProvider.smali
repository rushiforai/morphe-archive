.class public Lcom/clevertap/android/sdk/pushnotification/fcm/FcmPushProvider;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xw3;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "unused"
    }
.end annotation

.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field private handler:Ll/qtl;


# direct methods
.method public constructor <init>(Ll/yw3;Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "unused"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/slg;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p3}, Ll/slg;-><init>(Ll/yw3;Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/FcmPushProvider;->handler:Ll/qtl;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getPushType()Ll/kob0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/FcmPushProvider;->handler:Ll/qtl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qtl;->getPushType()Ll/kob0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isAvailable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/FcmPushProvider;->handler:Ll/qtl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qtl;->isAvailable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/FcmPushProvider;->handler:Ll/qtl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qtl;->isSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public minSDKSupportVersionCode()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public requestToken()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/FcmPushProvider;->handler:Ll/qtl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qtl;->requestToken()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setHandler(Ll/qtl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/FcmPushProvider;->handler:Ll/qtl;

    .line 2
    .line 3
    return-void
.end method
