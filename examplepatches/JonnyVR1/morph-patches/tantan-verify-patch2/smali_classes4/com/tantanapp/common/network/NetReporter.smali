.class public Lcom/tantanapp/common/network/NetReporter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static reportErrorAction:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private static shouldReport:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


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

.method public static init(Ll/y20;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sput-object p0, Lcom/tantanapp/common/network/NetReporter;->reportErrorAction:Ll/y20;

    .line 2
    .line 3
    sput-object p1, Lcom/tantanapp/common/network/NetReporter;->shouldReport:Ll/pcj;

    .line 4
    .line 5
    return-void
.end method

.method public static reportError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/network/NetReporter;->reportErrorAction:Ll/y20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/network/NetReporter;->shouldReport:Ll/pcj;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/tantanapp/common/network/NetReporter;->reportErrorAction:Ll/y20;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
