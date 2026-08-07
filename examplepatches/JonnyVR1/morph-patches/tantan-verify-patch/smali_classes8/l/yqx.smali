.class public Ll/yqx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/yqx$b;,
        Ll/yqx$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/yqx$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/yqx;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/yqx;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ll/zqx;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ll/yqx;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/yqx;IILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yqx;->d(IILandroid/os/Bundle;)V

    return-void
.end method

.method public static b()Ll/yqx;
    .locals 1

    .line 1
    invoke-static {}, Ll/yqx$b;->a()Ll/yqx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public c()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/yqx;->b:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final synthetic d(IILandroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqx;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/yqx$a;

    .line 18
    .line 19
    invoke-interface {v1, p1, p2, p3}, Ll/yqx$a;->a(IILandroid/os/Bundle;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iput p2, p0, Ll/yqx;->b:I

    .line 24
    .line 25
    return-void
.end method

.method public e(IILandroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Ll/xqx;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/xqx;-><init>(Ll/yqx;IILandroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Ll/yqx$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqx;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Ll/yqx$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqx;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
