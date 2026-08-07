.class public Lcom/p1/mobile/account_core/request_data/RequestData;
.super Lcom/p1/mobile/account_core/request_data/JsonData;
.source "SourceFile"


# instance fields
.field public final clientId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/JsonData;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/tv;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/RequestData;->clientId:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public checkNull()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->checkNull()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/account_core/request_data/RequestData;->clientId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "clientId should not empty! "

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
