.class public Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/push/framework/aidl/IMessageEntity;


# instance fields
.field public statusCode:I
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field

.field public statusMessage:Ljava/lang/String;
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;->statusCode:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;->statusCode:I

    iput-object p2, p0, Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;->statusMessage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .locals 0

    iget p0, p0, Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;->statusCode:I

    return p0
.end method

.method public getStatusMessage()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;->statusMessage:Ljava/lang/String;

    return-object p0
.end method

.method public setStatusCode(I)V
    .locals 0

    iput p1, p0, Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;->statusCode:I

    return-void
.end method

.method public setStatusMessage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/entity/ResponseHeader;->statusMessage:Ljava/lang/String;

    return-void
.end method
