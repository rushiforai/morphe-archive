.class public Ll/si20;
.super Lcom/tantanapp/common/network/NetReqObs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/si20$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/tantanapp/common/network/NetReqObs<",
        "TT;>;"
    }
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 22
    invoke-direct {p0, p1, p2, v0, v1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Lcom/tantanapp/common/data/DataChecker;Z)V

    return-void
.end method

.method public constructor <init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Lcom/tantanapp/common/data/DataChecker;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, p2, p3, v0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Lcom/tantanapp/common/data/DataChecker;Z)V

    return-void
.end method

.method public constructor <init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Lcom/tantanapp/common/data/DataChecker;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;",
            "Lcom/tantanapp/common/data/DataChecker;",
            "Z)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 24
    invoke-direct/range {v0 .. v5}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Lcom/tantanapp/common/data/DataChecker;ZLl/z20;)V

    return-void
.end method

.method public constructor <init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Lcom/tantanapp/common/data/DataChecker;ZLl/z20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;",
            "Lcom/tantanapp/common/data/DataChecker;",
            "Z",
            "Ll/z20<",
            "Ll/i5d0;",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v6, Ll/si20$a;

    .line 2
    .line 3
    invoke-direct {v6}, Ll/si20$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v7, Ll/ri20;

    .line 7
    .line 8
    invoke-direct {v7}, Ll/ri20;-><init>()V

    .line 9
    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    move-object v2, p2

    .line 14
    move-object v4, p3

    .line 15
    move v3, p4

    .line 16
    move-object v5, p5

    .line 17
    invoke-direct/range {v0 .. v7}, Lcom/tantanapp/common/network/NetReqObs;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;ZLcom/tantanapp/common/data/DataChecker;Ll/z20;Lcom/tantanapp/common/network/ApiCallBack;Ll/qcj;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lcom/tantanapp/common/data/INetParser<",
            "TT;>;Z)V"
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    .line 21
    invoke-direct/range {v0 .. v5}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Lcom/tantanapp/common/data/DataChecker;ZLl/z20;)V

    return-void
.end method

.method public static synthetic a(Ll/x1d0;)Ll/rg50;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/api/api/Network;->getHttp(Ll/x1d0;)Ll/rg50;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
