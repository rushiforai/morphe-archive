.class public Ll/hti;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/oo2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public c:F

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ll/qwl;


# direct methods
.method public constructor <init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;F)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "F)V"
        }
    .end annotation

    .line 21
    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Ll/hti;-><init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;FLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;FLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "F",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/hti;->a:Lrx/subjects/a;

    .line 9
    .line 10
    iput-object p1, p0, Ll/hti;->b:Ll/oo2;

    .line 11
    .line 12
    iput-object p2, p0, Ll/hti;->d:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p3, p0, Ll/hti;->e:Ljava/lang/String;

    .line 15
    .line 16
    iput p4, p0, Ll/hti;->c:F

    .line 17
    .line 18
    iput-object p5, p0, Ll/hti;->f:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    .line 22
    invoke-direct/range {v0 .. v5}, Ll/hti;-><init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;FLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hti;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hti;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hti;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/qwl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hti;->g:Ll/qwl;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/oo2;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hti;->b:Ll/oo2;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hti;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()F
    .locals 0

    .line 1
    iget p0, p0, Ll/hti;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hti;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i(Ll/qwl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hti;->g:Ll/qwl;

    .line 2
    .line 3
    return-void
.end method
