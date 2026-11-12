.class public final Lcom/leanplum/FirebaseUtilKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0008\u0010\u0000\u001a\u00020\u0001H\u0000\u001a\u0010\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0004H\u0000\u00a8\u0006\u0005"
    }
    d2 = {
        "unregister",
        "",
        "updateRegistrationId",
        "provider",
        "Lcom/leanplum/LeanplumCloudMessagingProvider;",
        "AndroidSDKFcm_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final unregister()V
    .registers 2

    :try_start_0
    sget-object v0, Lcom/leanplum/Present;->INSTANCE:Lcom/leanplum/Present;

    invoke-virtual {v0}, Lcom/leanplum/Present;->unregister()V
    :try_end_5
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Using legacy firebase methods."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/leanplum/Legacy;->INSTANCE:Lcom/leanplum/Legacy;

    invoke-virtual {v0}, Lcom/leanplum/Legacy;->unregister()V

    return-void
.end method

.method public static final updateRegistrationId(Lcom/leanplum/LeanplumCloudMessagingProvider;)V
    .registers 3
    .param p0    # Lcom/leanplum/LeanplumCloudMessagingProvider;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    :try_start_0
    sget-object v0, Lcom/leanplum/Present;->INSTANCE:Lcom/leanplum/Present;

    invoke-virtual {v0, p0}, Lcom/leanplum/Present;->updateRegistrationId(Lcom/leanplum/LeanplumCloudMessagingProvider;)V
    :try_end_5
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Using legacy firebase methods."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/leanplum/Legacy;->INSTANCE:Lcom/leanplum/Legacy;

    invoke-virtual {v0, p0}, Lcom/leanplum/Legacy;->updateRegistrationId(Lcom/leanplum/LeanplumCloudMessagingProvider;)V

    return-void
.end method
