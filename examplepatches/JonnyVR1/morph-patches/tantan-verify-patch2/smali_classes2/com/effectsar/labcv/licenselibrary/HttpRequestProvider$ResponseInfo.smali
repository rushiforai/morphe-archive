.class public Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResponseInfo"
.end annotation


# instance fields
.field public bodySize:I

.field public bodydata:Ljava/lang/String;

.field public isSuc:Z

.field public responseHead:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public status_code:I

.field public userdata:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;->isSuc:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;->status_code:I

    .line 8
    .line 9
    new-instance v1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;->responseHead:Ljava/util/HashMap;

    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    iput-object v1, p0, Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;->bodydata:Ljava/lang/String;

    .line 19
    .line 20
    iput v0, p0, Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;->bodySize:I

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;->userdata:J

    .line 25
    .line 26
    return-void
.end method
