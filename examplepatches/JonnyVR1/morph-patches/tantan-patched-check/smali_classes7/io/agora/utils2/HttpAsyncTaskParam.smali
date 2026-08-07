.class Lio/agora/utils2/HttpAsyncTaskParam;
.super Ljava/lang/Object;


# instance fields
.field public agent:Ljava/lang/String;

.field public body:[B

.field public fullUrl:Ljava/lang/String;

.field public headers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field httpProxy:Ljava/net/Proxy;

.field public method:Ljava/lang/String;

.field public pass:Ljava/lang/String;

.field public timeout_millsec:I

.field public user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
