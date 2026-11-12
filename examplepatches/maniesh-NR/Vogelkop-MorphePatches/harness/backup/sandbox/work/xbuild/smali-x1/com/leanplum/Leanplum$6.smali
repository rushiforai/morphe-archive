.class Lcom/leanplum/Leanplum$6;
.super Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->handleStartResponse(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/String;)V
    .registers 3

    if-eqz p1, :cond_f

    :try_start_2
    new-instance v0, Lcom/leanplum/Leanplum$6$1;

    invoke-direct {v0, p0}, Lcom/leanplum/Leanplum$6$1;-><init>(Lcom/leanplum/Leanplum$6;)V

    invoke-static {p1, v0}, Lcom/leanplum/internal/Registration;->registerDevice(Ljava/lang/String;Lcom/leanplum/callbacks/StartCallback;)V
    :try_end_a
    .catchall {:try_start_2 .. :try_end_a} :catchall_b

    return-void

    :catchall_b
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_f
    return-void
.end method
