.class public Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FetchLicenseResult"
.end annotation


# instance fields
.field public auth_type:Ljava/lang/String;

.field public bind_type:Ljava/lang/String;

.field public error_code:I

.field public error_msg:Ljava/lang/String;

.field public http_status:I

.field public license:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x3ea

    .line 5
    .line 6
    iput p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_code:I

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->http_status:I

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    iput-object p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_msg:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->license:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->bind_type:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->auth_type:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method
