.class final Lcom/leanplum/Present;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0003\u001a\u00020\u0004J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/leanplum/Present;",
        "",
        "()V",
        "unregister",
        "",
        "updateRegistrationId",
        "provider",
        "Lcom/leanplum/LeanplumCloudMessagingProvider;",
        "AndroidSDKFcm_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/leanplum/Present;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/Present;

    invoke-direct {v0}, Lcom/leanplum/Present;-><init>()V

    sput-object v0, Lcom/leanplum/Present;->INSTANCE:Lcom/leanplum/Present;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/LeanplumCloudMessagingProvider;Lcom/google/android/gms/tasks/Task;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/Present;->updateRegistrationId$lambda$0(Lcom/leanplum/LeanplumCloudMessagingProvider;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method private static final updateRegistrationId$lambda$0(Lcom/leanplum/LeanplumCloudMessagingProvider;Lcom/google/android/gms/tasks/Task;)V
    .registers 3

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual {p0, p1}, Lcom/leanplum/LeanplumCloudMessagingProvider;->setRegistrationId(Ljava/lang/String;)V

    :cond_17
    return-void

    :cond_18
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "getToken failed:\n"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final unregister()V
    .registers 3

    const/4 p0, 0x0

    :try_start_1
    const-class v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_1c

    :try_start_4
    invoke-static {}, Lr49;->e()Lr49;

    move-result-object v1

    invoke-static {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->getInstance(Lr49;)Lcom/google/firebase/messaging/FirebaseMessaging;

    move-result-object v1
    :try_end_c
    .catchall {:try_start_4 .. :try_end_c} :catchall_1a

    :try_start_c
    monitor-exit v0

    invoke-virtual {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->b()Lcom/google/android/gms/tasks/Task;

    const-string v0, "Application was unregistered from FirebaseMessaging."

    new-array v1, p0, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_17} :catch_1c

    return-void

    :goto_18
    :try_start_18
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_1a

    :try_start_19
    throw v1
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1a} :catch_1c

    :catchall_1a
    move-exception v1

    goto :goto_18

    :catch_1c
    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "Failed to unregister from FirebaseMessaging."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public final updateRegistrationId(Lcom/leanplum/LeanplumCloudMessagingProvider;)V
    .registers 4
    .param p1    # Lcom/leanplum/LeanplumCloudMessagingProvider;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-class p0, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter p0

    :try_start_3
    invoke-static {}, Lr49;->e()Lr49;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->getInstance(Lr49;)Lcom/google/firebase/messaging/FirebaseMessaging;

    move-result-object v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_1c

    monitor-exit p0

    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->f()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v0, Lcom/leanplum/b;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lcom/leanplum/b;-><init>(Lcom/leanplum/LeanplumCloudMessagingProvider;B)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :goto_1a
    :try_start_1a
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_1c

    throw p1

    :catchall_1c
    move-exception p1

    goto :goto_1a
.end method
