.class public Ll/th3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/app/Application;

.field public b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

.field public c:Ll/c0j0;

.field public d:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;

.field public e:Ll/lyt;

.field public f:Ll/ixl;

.field public g:Ll/vzv;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bzm;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/qum;

.field public j:Ll/etf0;

.field public k:Ll/r3w;


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
    iput-object v0, p0, Ll/th3;->h:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ll/bzm;)Ll/th3;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/th3;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b()Ll/wg50;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/th3;->e:Ll/lyt;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/xxk;

    .line 6
    .line 7
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/p6s;->C0()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-direct {v0, v1}, Ll/xxk;-><init>(Z)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/th3;->e:Ll/lyt;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/th3;->i:Ll/qum;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ll/qum;->a()Ll/qum;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/th3;->i:Ll/qum;

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Ll/th3;->g:Ll/vzv;

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-static {}, Ll/vzv;->c()Ll/vzv;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/th3;->g:Ll/vzv;

    .line 39
    .line 40
    :cond_2
    new-instance v0, Ll/smc0;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/smc0;-><init>(Ll/th3;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/wg50;

    .line 46
    .line 47
    invoke-direct {p0, v0}, Ll/wg50;-><init>(Ll/smc0;)V

    .line 48
    .line 49
    .line 50
    return-object p0
.end method

.method public c(Landroid/app/Application;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->a:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->b:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->d:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/ixl;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->f:Ll/ixl;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/qum;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->i:Ll/qum;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/r3w;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->k:Ll/r3w;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/etf0;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->j:Ll/etf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ll/c0j0;)Ll/th3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th3;->c:Ll/c0j0;

    .line 2
    .line 3
    return-object p0
.end method
