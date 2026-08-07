.class public abstract Ll/qq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u1m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam<",
        "TP;>;P:",
        "Ll/l6t<",
        "TV;>;>",
        "Ljava/lang/Object;",
        "Ll/u1m<",
        "TV;TP;>;"
    }
.end annotation


# instance fields
.field public a:Ll/dum;

.field public b:Ll/l6t;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public c:Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qq2;->a:Ll/dum;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d(Ll/l6t;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l6t<",
            "TV;>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;",
            ")",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/qq2;->e()Ll/iam;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/qq2;->c:Ll/iam;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p2}, Ll/u1m;->b(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/k3m;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/l6t;

    .line 18
    .line 19
    iput-object v0, p0, Ll/qq2;->b:Ll/l6t;

    .line 20
    .line 21
    iget-object v1, p0, Ll/qq2;->c:Ll/iam;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/l6t;->C(Ll/iam;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/qq2;->b:Ll/l6t;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 29
    .line 30
    .line 31
    invoke-interface {p0, p2}, Ll/u1m;->c(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/qq2;->c:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Landroid/view/View;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return-object p0
.end method

.method public e()Ll/iam;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qq2;->a:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0}, Ll/u1m;->a()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    instance-of v0, p0, Ll/iam;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    check-cast p0, Ll/iam;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    return-object v1
.end method
