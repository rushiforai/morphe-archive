.class public Lcom/p1/mobile/account_core/request_data/H5Data;
.super Lcom/p1/mobile/account_core/request_data/RequestData;
.source "SourceFile"


# instance fields
.field grant_type:Ljava/lang/String;

.field scope:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/RequestData;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "client_credentials"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/H5Data;->grant_type:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "H5"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/H5Data;->scope:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method
