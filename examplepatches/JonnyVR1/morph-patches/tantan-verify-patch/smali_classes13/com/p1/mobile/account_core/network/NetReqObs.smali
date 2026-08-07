.class public Lcom/p1/mobile/account_core/network/NetReqObs;
.super Lrx/c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/c<",
        "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
        ">;"
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "NetReqObs"


# direct methods
.method public constructor <init>(Ll/pcj;Lcom/p1/mobile/account_core/network/ApiCallBack;Ll/qcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/p1/mobile/account_core/network/ApiCallBack;",
            "Ll/qcj<",
            "Ll/x1d0;",
            "Ll/rg50;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lcom/p1/mobile/account_core/network/NetReqObs$OnSubs;-><init>(Ll/pcj;Lcom/p1/mobile/account_core/network/ApiCallBack;Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
