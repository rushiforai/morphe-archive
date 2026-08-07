.class public final Ll/nwg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qtg0;


# instance fields
.field public final synthetic a:Ll/bfg0;


# direct methods
.method public constructor <init>(Ll/bfg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nwg0;->a:Ll/bfg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onCompleted(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nwg0;->a:Ll/bfg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/bfg0;->b:Ll/dhg0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dhg0;->z:Ljava/util/ArrayList;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    :goto_0
    iget-object p0, p0, Ll/nwg0;->a:Ll/bfg0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 16
    .line 17
    const-string v0, "a2ms-ai-common"

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v0, p1, v1}, Ll/dhg0;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
