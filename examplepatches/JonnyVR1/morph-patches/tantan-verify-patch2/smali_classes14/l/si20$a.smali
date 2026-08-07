.class public Ll/si20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/common/network/ApiCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/si20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


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
.method public beforeCall(Ll/x1d0;)Ll/x1d0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->maybeUpdateRequestBeforeCall(Ll/x1d0;)Ll/x1d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object p1, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->API:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/hl20;->b(Ll/x1d0;Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)Ll/x1d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public decodeResponse(Ll/i5d0;)Ll/k5d0;
    .locals 0
    .param p1    # Ll/i5d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/f1f;->h(Ll/i5d0;)Ll/k5d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public requestCancel(Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hl20;->d(Ll/x1d0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public whenApiError(Ll/x1d0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/hl20;->a(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public whenApiFinish(Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/kl20;->b()Ll/kl20;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/hl20;->c(Ll/x1d0;Ll/v4m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public whenGetResponse(Ll/x1d0;Ll/i5d0;)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    const-string p1, "Date"

    .line 4
    .line 5
    invoke-virtual {p2, p1}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->updateServerTime(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public whenResponseCheckError(Lcom/tantanapp/common/network/ApiExcep;)Ljava/lang/Exception;
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->boxException(Lcom/tantanapp/common/network/ApiExcep;)Ljava/lang/Exception;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
