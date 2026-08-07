.class public Ll/x91;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/p2g0;


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a3g0;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Ll/d3g0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/d3g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x91;->c:Ll/d3g0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/d3g0;)Ll/p2g0;
    .locals 3

    .line 1
    iget v0, p0, Ll/x91;->b:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/x91;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/x91;->a:Ljava/util/List;

    .line 13
    .line 14
    iget v1, p0, Ll/x91;->b:I

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/a3g0;

    .line 21
    .line 22
    iget-object v1, p0, Ll/x91;->a:Ljava/util/List;

    .line 23
    .line 24
    iget v2, p0, Ll/x91;->b:I

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    invoke-virtual {p0, v1, v2, p1}, Ll/x91;->c(Ljava/util/List;ILl/d3g0;)Ll/x91;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Ll/a3g0;->a(Ll/p2g0;)V

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public c(Ljava/util/List;ILl/d3g0;)Ll/x91;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a3g0;",
            ">;I",
            "Ll/d3g0;",
            ")",
            "Ll/x91;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/x91;->a:Ljava/util/List;

    .line 2
    .line 3
    iput p2, p0, Ll/x91;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/x91;->c:Ll/d3g0;

    .line 6
    .line 7
    return-object p0
.end method
