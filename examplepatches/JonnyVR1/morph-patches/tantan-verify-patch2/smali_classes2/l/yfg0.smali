.class public final Ll/yfg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/network/detection/INetworkDetectionFuture;


# instance fields
.field public final synthetic a:Ll/chg0;


# direct methods
.method public constructor <init>(Ll/chg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yfg0;->a:Ll/chg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/yfg0;->a:Ll/chg0;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/chg0;->d:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/chg0;->d:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/chg0;->a:Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;

    .line 13
    .line 14
    iput-object v0, p0, Ll/chg0;->b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

    .line 15
    .line 16
    iget-object p0, p0, Ll/chg0;->h:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    :cond_1
    :goto_0
    if-ge v1, v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    check-cast v2, Ll/neg0;

    .line 32
    .line 33
    iget-object v3, v2, Ll/neg0;->a:Ll/ry3;

    .line 34
    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-interface {v3}, Ll/ry3;->isExecuted()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    iget-object v2, v2, Ll/neg0;->a:Ll/ry3;

    .line 44
    .line 45
    invoke-interface {v2}, Ll/ry3;->cancel()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    :goto_1
    return-void
.end method

.method public final isCanceled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfg0;->a:Ll/chg0;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/chg0;->d:Z

    .line 4
    .line 5
    return p0
.end method
