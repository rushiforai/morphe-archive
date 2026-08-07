.class public Ll/vxr;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Ll/vxr;


# instance fields
.field public a:Ll/dyr;

.field public b:Ll/p6s;

.field public c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/dyr;Ll/p6s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vxr;->c:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vxr;->a:Ll/dyr;

    .line 7
    .line 8
    iput-object p3, p0, Ll/vxr;->b:Ll/p6s;

    .line 9
    .line 10
    return-void
.end method

.method public static a()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AuthData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/vxr;->h()Ll/dyr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/dyr;->accessOutterToken()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static d()Ll/p6s;
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->f()Ll/vxr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/vxr;->b:Ll/p6s;

    .line 6
    .line 7
    return-object v0
.end method

.method public static e()Landroid/content/Context;
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->f()Ll/vxr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/vxr;->c:Landroid/content/Context;

    .line 6
    .line 7
    return-object v0
.end method

.method public static f()Ll/vxr;
    .locals 1

    .line 1
    sget-object v0, Ll/vxr;->d:Ll/vxr;

    .line 2
    .line 3
    return-object v0
.end method

.method public static g()Ll/vwt;
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->h()Ll/dyr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/dyr;->b()Ll/vwt;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static h()Ll/dyr;
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->f()Ll/vxr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vxr;->c()Ll/dyr;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static i(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->h()Ll/dyr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0, p1}, Ll/dyr;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static j(Landroid/content/Context;Ll/dyr;Ll/p6s;)V
    .locals 1

    .line 1
    sget-object v0, Ll/vxr;->d:Ll/vxr;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/vxr;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1, p2}, Ll/vxr;-><init>(Landroid/content/Context;Ll/dyr;Ll/p6s;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/vxr;->d:Ll/vxr;

    .line 12
    .line 13
    return-void
.end method

.method public static k()V
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->h()Ll/dyr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/dyr;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static l()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->h()Ll/dyr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/dyr;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    invoke-static {}, Ll/yw0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/tdh0;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final c()Ll/dyr;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vxr;->a:Ll/dyr;

    .line 2
    .line 3
    return-object p0
.end method
