.class public Lcom/hihonor/push/framework/aidl/entity/PushTokenResult;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/push/framework/aidl/IMessageEntity;


# instance fields
.field private pushToken:Ljava/lang/String;
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hihonor/push/framework/aidl/entity/PushTokenResult;->pushToken:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getPushToken()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/entity/PushTokenResult;->pushToken:Ljava/lang/String;

    return-object p0
.end method

.method public setPushToken(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/entity/PushTokenResult;->pushToken:Ljava/lang/String;

    return-void
.end method
