.class public Lcom/tantanapp/common/network/NetReqObs;
.super Lrx/c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/network/NetReqObs$OnSubs;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/c<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "NetReqObs"


# direct methods
.method public constructor <init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;ZLcom/tantanapp/common/data/DataChecker;Ll/z20;Lcom/tantanapp/common/network/ApiCallBack;Ll/qcj;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;Z",
            "Lcom/tantanapp/common/data/DataChecker;",
            "Ll/z20<",
            "Ll/i5d0;",
            "TT;>;",
            "Lcom/tantanapp/common/network/ApiCallBack;",
            "Ll/qcj<",
            "Ll/x1d0;",
            "Ll/rg50;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/network/NetReqObs$OnSubs;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    move-object v7, p7

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/tantanapp/common/network/NetReqObs$OnSubs;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;ZLcom/tantanapp/common/data/DataChecker;Ll/z20;Lcom/tantanapp/common/network/ApiCallBack;Ll/qcj;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
