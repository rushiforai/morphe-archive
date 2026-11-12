.class Lcom/leanplum/LeanplumFcmProvider;
.super Lcom/leanplum/LeanplumCloudMessagingProvider;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/LeanplumCloudMessagingProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getSharedPrefsPropertyName()Ljava/lang/String;
    .registers 1

    const-string p0, "registration_id"

    return-object p0
.end method

.method public getType()Lcom/leanplum/PushProviderType;
    .registers 1

    sget-object p0, Lcom/leanplum/PushProviderType;->FCM:Lcom/leanplum/PushProviderType;

    return-object p0
.end method

.method public unregister()V
    .registers 1

    sget-boolean p0, Lcom/leanplum/internal/Constants;->disableFcmTokenAutoRefresh:Z

    if-eqz p0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lcom/leanplum/FirebaseUtilKt;->unregister()V

    return-void
.end method

.method public updateRegistrationId()V
    .registers 2

    sget-boolean v0, Lcom/leanplum/internal/Constants;->disableFcmTokenAutoRefresh:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-static {p0}, Lcom/leanplum/FirebaseUtilKt;->updateRegistrationId(Lcom/leanplum/LeanplumCloudMessagingProvider;)V

    return-void
.end method
