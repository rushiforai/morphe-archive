.class public Lcom/leanplum/OperaLeanplumHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setRegistrationId(Ljava/lang/String;)V
    .registers 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    sget-object v0, Lcom/leanplum/PushProviderType;->FCM:Lcom/leanplum/PushProviderType;

    invoke-static {v0, p0}, Lcom/leanplum/Leanplum;->setRegistrationId(Lcom/leanplum/PushProviderType;Ljava/lang/String;)V

    return-void
.end method
