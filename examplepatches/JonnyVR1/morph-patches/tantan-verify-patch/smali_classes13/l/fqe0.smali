.class public abstract Ll/fqe0;
.super Ll/jlb0;
.source "SourceFile"

# interfaces
.implements Ll/f3m;
.implements Ll/d3m;


# instance fields
.field public d:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:Ll/z2m;

.field public g:Ll/c3m;

.field public h:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jlb0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/fqe0;->h:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public abstract A()I
    .annotation build Landroidx/annotation/IntRange;
        from = 0x0L
    .end annotation
.end method

.method public a()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p0, v1}, Ll/llb0;->h(Ll/fqe0;Z)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public h(Ll/al80;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/al80;->j()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {v0, p0, p1}, Ll/llb0;->h(Ll/fqe0;Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public i(Ll/z2m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 2
    .line 3
    return-void
.end method

.method public t()Ll/c3m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fqe0;->g:Ll/c3m;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fqe0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fqe0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public w(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fqe0;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public x(Ll/c3m;)Ll/fqe0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fqe0;->g:Ll/c3m;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fqe0;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public z(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    return-void
.end method
