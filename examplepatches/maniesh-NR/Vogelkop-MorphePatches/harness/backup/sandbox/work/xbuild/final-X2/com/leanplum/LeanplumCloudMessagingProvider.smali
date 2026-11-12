.class abstract Lcom/leanplum/LeanplumCloudMessagingProvider;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/IPushProvider;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRegistrationId()Ljava/lang/String;
    .registers 3

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    const-string v1, "__leanplum_push__"

    invoke-virtual {p0}, Lcom/leanplum/LeanplumCloudMessagingProvider;->getSharedPrefsPropertyName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lcom/leanplum/utils/SharedPreferencesUtil;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public abstract getSharedPrefsPropertyName()Ljava/lang/String;
.end method

.method public setRegistrationId(Ljava/lang/String;)V
    .registers 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-interface {p0}, Lcom/leanplum/IPushProvider;->getType()Lcom/leanplum/PushProviderType;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "Registration ID for %s is undefined."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_14
    invoke-interface {p0}, Lcom/leanplum/IPushProvider;->getType()Lcom/leanplum/PushProviderType;

    move-result-object v0

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Registering for %s push notifications with ID %s"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/leanplum/LeanplumCloudMessagingProvider;->getRegistrationId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3d

    invoke-virtual {p0, p1}, Lcom/leanplum/LeanplumCloudMessagingProvider;->storeRegistrationId(Ljava/lang/String;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Sending registration ID to backend."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {p0}, Lcom/leanplum/IPushProvider;->getType()Lcom/leanplum/PushProviderType;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/leanplum/Leanplum;->setRegistrationId(Lcom/leanplum/PushProviderType;Ljava/lang/String;)V

    :cond_3d
    return-void
.end method

.method public storeRegistrationId(Ljava/lang/String;)V
    .registers 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const-string v1, "Saving the registration ID %s in the shared preferences."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string v1, "__leanplum_push__"

    invoke-virtual {p0}, Lcom/leanplum/LeanplumCloudMessagingProvider;->getSharedPrefsPropertyName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, v1, p0, p1}, Lcom/leanplum/utils/SharedPreferencesUtil;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
