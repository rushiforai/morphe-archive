.class Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/LastRegistKeeper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegistSelfToken"
.end annotation


# instance fields
.field alias:Ljava/lang/String;

.field appId:Ljava/lang/String;

.field deviceId:Ljava/lang/String;

.field sn:Ljava/lang/String;

.field tryReferee:Z


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


# virtual methods
.method public requestRegistSelfToken()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->deviceId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->alias:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->sn:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->tryReferee:Z

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/cosmos/photon/push/PushApi;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
