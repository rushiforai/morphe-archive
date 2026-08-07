.class public Ll/tl9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ikh0;

.field public b:Ll/skk0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ikh0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ikh0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/tl9;->a:Ll/ikh0;

    .line 10
    .line 11
    new-instance v0, Ll/skk0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/skk0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/tl9;->b:Ll/skk0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Ll/ikh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl9;->a:Ll/ikh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/skk0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl9;->b:Ll/skk0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/dxv$c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xhe0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xhe0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/ot50;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/ot50;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/grl0;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/grl0;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Ll/tl9;->a:Ll/ikh0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/tl9;->b:Ll/skk0;

    .line 19
    .line 20
    new-instance v4, Ll/cl50;

    .line 21
    .line 22
    invoke-direct {v4}, Ll/cl50;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v5, 0x6

    .line 26
    new-array v5, v5, [Ll/dxv$c;

    .line 27
    .line 28
    const/4 v6, 0x0

    .line 29
    aput-object v0, v5, v6

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    aput-object v1, v5, v0

    .line 33
    .line 34
    const/4 v0, 0x2

    .line 35
    aput-object v2, v5, v0

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    aput-object v3, v5, v0

    .line 39
    .line 40
    const/4 v0, 0x4

    .line 41
    aput-object p0, v5, v0

    .line 42
    .line 43
    const/4 p0, 0x5

    .line 44
    aput-object v4, v5, p0

    .line 45
    .line 46
    invoke-static {v5}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method
