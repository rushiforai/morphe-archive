.class Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/LastRegistKeeper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegistVendorToken"
.end annotation


# instance fields
.field appId:Ljava/lang/String;

.field token:Ljava/lang/String;

.field vendorToken:Ljava/lang/String;

.field vendorType:Ljava/lang/String;


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
.method public requestVendorToken()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->token:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->vendorType:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->vendorToken:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/cosmos/photon/push/PushApi;->regVendor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
