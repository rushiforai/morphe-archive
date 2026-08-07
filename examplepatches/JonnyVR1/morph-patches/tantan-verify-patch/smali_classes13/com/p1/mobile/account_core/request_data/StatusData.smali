.class public Lcom/p1/mobile/account_core/request_data/StatusData;
.super Lcom/p1/mobile/account_core/request_data/RequestData;
.source "SourceFile"


# instance fields
.field public channel:Ljava/lang/String;

.field public mcc:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "MCC"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/RequestData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
