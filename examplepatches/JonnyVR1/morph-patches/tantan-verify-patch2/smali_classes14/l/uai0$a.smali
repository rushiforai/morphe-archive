.class public Ll/uai0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/account_core/network/ApiCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uai0;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uai0;


# direct methods
.method public constructor <init>(Ll/uai0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uai0$a;->a:Ll/uai0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
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
    return-object p0
.end method

.method public beforeExceptionCheck(Ll/i5d0;)Ljava/lang/Exception;
    .locals 1

    .line 1
    const-string p0, "Putong-Client-Version-Expires-At"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "-1"

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    new-instance p0, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;-><init>(Ll/i5d0;)V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public whenApiError(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    return-void
.end method

.method public whenApiFinish()V
    .locals 0

    .line 1
    return-void
.end method

.method public whenGetRealCall(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public whenGetResponse(Ll/i5d0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uai0$a;->a:Ll/uai0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Ll/uai0;->f(Ll/uai0;Ll/k5d0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
