.class public Ll/osh0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/osh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Ll/x4m;

.field public e:J

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/util/concurrent/ThreadPoolExecutor;

.field public i:I

.field public final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a1j0;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/z0j0;",
            ">;"
        }
    .end annotation
.end field

.field public l:J

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x64

    .line 5
    .line 6
    iput-wide v0, p0, Ll/osh0$a;->e:J

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/osh0$a;->j:Ljava/util/List;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/osh0$a;->k:Ljava/util/List;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic a(Ll/osh0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->m:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/osh0$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->k:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/osh0$a;)Ll/x4m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->d:Ll/x4m;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/osh0$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->j:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/osh0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0$a;->o:Z

    return p0
.end method

.method public static bridge synthetic f(Ll/osh0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0$a;->s:Z

    return p0
.end method

.method public static bridge synthetic g(Ll/osh0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0$a;->q:Z

    return p0
.end method

.method public static bridge synthetic h(Ll/osh0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0$a;->r:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/osh0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0$a;->p:Z

    return p0
.end method

.method public static bridge synthetic j(Ll/osh0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/osh0$a;->t:Z

    return p0
.end method

.method public static bridge synthetic k(Ll/osh0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0$a;->a:I

    return p0
.end method

.method public static bridge synthetic l(Ll/osh0$a;)Ll/zwl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static bridge synthetic m(Ll/osh0$a;)Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->h:Ljava/util/concurrent/ThreadPoolExecutor;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/osh0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->n:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic o(Ll/osh0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic p(Ll/osh0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osh0$a;->f:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/osh0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0$a;->i:I

    return p0
.end method

.method public static bridge synthetic r(Ll/osh0$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/osh0$a;->l:J

    return-wide v0
.end method

.method public static bridge synthetic s(Ll/osh0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0$a;->b:I

    return p0
.end method

.method public static bridge synthetic t(Ll/osh0$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/osh0$a;->e:J

    return-wide v0
.end method

.method public static bridge synthetic u(Ll/osh0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/osh0$a;->c:I

    return p0
.end method

.method public static y()Ll/osh0$a;
    .locals 1

    .line 1
    new-instance v0, Ll/osh0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/osh0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public A(Z)Ll/osh0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/osh0$a;->o:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public B(Z)Ll/osh0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/osh0$a;->s:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public C(I)Ll/osh0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/osh0$a;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public D(Z)Ll/osh0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/osh0$a;->q:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Z)Ll/osh0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/osh0$a;->r:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Z)Ll/osh0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/osh0$a;->p:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Z)Ll/osh0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/osh0$a;->t:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Ljava/lang/String;)Ll/osh0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/osh0$a;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Ljava/lang/String;)Ll/osh0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/osh0$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Ljava/lang/String;)Ll/osh0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/osh0$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Ll/x4m;)Ll/osh0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/osh0$a;->d:Ll/x4m;

    .line 2
    .line 3
    return-object p0
.end method

.method public L(I)Ll/osh0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/osh0$a;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public M(J)Ll/osh0$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/osh0$a;->l:J

    .line 2
    .line 3
    return-object p0
.end method

.method public N(I)Ll/osh0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/osh0$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public O(I)Ll/osh0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/osh0$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ll/z0j0;)Ll/osh0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/osh0$a;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public w(Ll/a1j0;)Ll/osh0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/osh0$a;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public x()Ll/osh0;
    .locals 1

    .line 1
    new-instance v0, Ll/osh0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/osh0;-><init>(Ll/osh0$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public z(Ljava/lang/String;)Ll/osh0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/osh0$a;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
