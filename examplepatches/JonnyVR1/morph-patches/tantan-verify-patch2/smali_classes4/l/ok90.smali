.class public abstract Ll/ok90;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected c:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected d:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private e:Ll/i1n;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i1n;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/i1n;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ok90;->e:Ll/i1n;

    .line 10
    .line 11
    sget-object v0, Lcom/sunshine/engine/base/InterpolatorType;->linear:Lcom/sunshine/engine/base/InterpolatorType;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, p1, p2, v0}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ll/i1n;

    invoke-direct {v0}, Ll/i1n;-><init>()V

    iput-object v0, p0, Ll/ok90;->e:Ll/i1n;

    .line 23
    invoke-virtual {p0, p1, p2, p3}, Ll/ok90;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;

    return-void
.end method


# virtual methods
.method public abstract a(F)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation
.end method

.method public b()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ok90;->c:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ok90;->a:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(F)F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ok90;->e:Ll/i1n;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i1n;->a(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ok90;->e:Ll/i1n;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i1n;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ok90;->d:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ok90;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    double-to-float v0, v0

    .line 6
    invoke-virtual {p0, v0}, Ll/ok90;->a(F)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public abstract i(Ljava/lang/Object;Ljava/lang/Object;)Ll/ok90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "Ll/ok90<",
            "TT;>;"
        }
    .end annotation
.end method

.method public j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ll/ok90;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;",
            "Ljava/lang/String;",
            ")",
            "Ll/ok90<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ok90;->i(Ljava/lang/Object;Ljava/lang/Object;)Ll/ok90;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p3}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public k(Ljava/lang/String;)Ll/ok90;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/ok90<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ok90;->e:Ll/i1n;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/i1n;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ok90;->a:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ok90;->b:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
