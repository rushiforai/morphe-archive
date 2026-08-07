.class public Ll/f9t;
.super Ll/si20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/si20<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Ll/f9t;-><init>(Ll/pcj;Z)V

    return-void
.end method

.method public constructor <init>(Ll/pcj;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;Z)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/f9t$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/f9t$a;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, v0, p2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
