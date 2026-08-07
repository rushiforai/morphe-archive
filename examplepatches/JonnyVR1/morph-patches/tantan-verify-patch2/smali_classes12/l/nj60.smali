.class public Ll/nj60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dj60;",
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
    iput-object v0, p0, Ll/nj60;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(FFFFFFLandroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nj60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static/range {p1 .. p7}, Ll/ej60;->a(FFFFFFLandroid/animation/TimeInterpolator;)Ll/dj60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/dj60;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nj60;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(FFLandroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nj60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1, p2, p3}, Ll/ej60;->b(FFLandroid/animation/TimeInterpolator;)Ll/dj60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(FFLandroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nj60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1, p2, p3}, Ll/ej60;->e(FFLandroid/animation/TimeInterpolator;)Ll/dj60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(FFFFLandroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nj60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1, p2, p3, p4, p5}, Ll/ej60;->c(FFFFLandroid/animation/TimeInterpolator;)Ll/dj60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
