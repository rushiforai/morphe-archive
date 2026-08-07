.class public Ll/xae;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rae;


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/rae;",
            ">;"
        }
    .end annotation
.end field


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
    iput-object v0, p0, Ll/xae;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e(FFLl/rae;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/rae;->b(FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(FFLl/rae;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/am50;->c(FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xae;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/tae;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/tae;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(FF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xae;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/vae;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/vae;-><init>(FF)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(FF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xae;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/uae;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/uae;-><init>(FF)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xae;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/wae;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/wae;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(Ll/rae;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xae;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
