.class public Ll/od2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/od2$a;,
        Ll/od2$c;,
        Ll/od2$b;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public d:J

.field public e:Z

.field public f:I

.field public g:Ljava/lang/String;

.field public h:I

.field public i:J

.field public j:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field public l:J

.field public m:J

.field public n:[I

.field public o:F

.field public p:Ll/od2$c;

.field public q:Ll/od2$b;

.field public r:Ll/od2$a;

.field public s:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/od2;->d:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/od2;->e:Z

    .line 10
    .line 11
    const-wide/16 v1, 0x1f4

    .line 12
    .line 13
    iput-wide v1, p0, Ll/od2;->i:J

    .line 14
    .line 15
    const-wide/16 v1, 0x12c

    .line 16
    .line 17
    iput-wide v1, p0, Ll/od2;->l:J

    .line 18
    .line 19
    iput-wide v1, p0, Ll/od2;->m:J

    .line 20
    .line 21
    const/4 v1, 0x4

    .line 22
    new-array v1, v1, [I

    .line 23
    .line 24
    iput-object v1, p0, Ll/od2;->n:[I

    .line 25
    .line 26
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/od2;->k:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-static {}, Ll/bnl0;->F0()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/high16 v1, 0x41800000    # 16.0f

    .line 38
    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr p1, v1

    .line 44
    const/high16 v1, 0x41700000    # 15.0f

    .line 45
    .line 46
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/high16 v3, 0x41200000    # 10.0f

    .line 55
    .line 56
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/high16 v4, 0x40a00000    # 5.0f

    .line 61
    .line 62
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    int-to-float v4, v4

    .line 67
    iput v4, p0, Ll/od2;->o:F

    .line 68
    .line 69
    iget-object p0, p0, Ll/od2;->n:[I

    .line 70
    .line 71
    aput p1, p0, v0

    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    aput v2, p0, p1

    .line 75
    .line 76
    const/4 p1, 0x2

    .line 77
    aput v1, p0, p1

    .line 78
    .line 79
    const/4 p1, 0x3

    .line 80
    aput v3, p0, p1

    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public A(Ll/od2$c;)Ll/od2;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/od2;->p:Ll/od2$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/od2;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/View;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/od2;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/od2;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/od2;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/od2;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/od2;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/od2;->k:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    return-object p0
.end method

.method public h()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/od2;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/od2;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/od2;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public k()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/od2;->n:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Landroid/view/ViewGroup;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/od2;->j:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/od2;->j:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/view/ViewGroup;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/od2;->k:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/od2;->k:Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Landroid/app/Activity;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    check-cast p0, Landroid/view/ViewGroup;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    const/4 p0, 0x0

    .line 54
    return-object p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/od2;->e:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public n(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/od2;->q:Ll/od2$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/od2;->s:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-interface {v0, p1, p0}, Ll/od2$b;->a(Landroid/view/View;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public o(Landroid/view/View;)Ll/od2;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/od2;->c:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-object p0
.end method

.method public p(Ll/od2$a;)Ll/od2;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/od2;->r:Ll/od2$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(J)Ll/od2;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Ll/od2;->d:J

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method

.method public r(ILjava/lang/String;)Ll/od2;
    .locals 0

    .line 1
    iput p1, p0, Ll/od2;->f:I

    .line 2
    .line 3
    iput-object p2, p0, Ll/od2;->g:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public s(IZ)Ll/od2;
    .locals 0

    .line 1
    iput p1, p0, Ll/od2;->b:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/od2;->e:Z

    .line 4
    .line 5
    return-object p0
.end method

.method public t(Landroid/view/View;)Ll/od2;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/od2;->a:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-object p0
.end method

.method public u(J)Ll/od2;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x7d0

    .line 8
    .line 9
    cmp-long v0, p1, v0

    .line 10
    .line 11
    if-gez v0, :cond_0

    .line 12
    .line 13
    iput-wide p1, p0, Ll/od2;->l:J

    .line 14
    .line 15
    :cond_0
    return-object p0
.end method

.method public v(I)Ll/od2;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/od2;->n:[I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    return-object p0
.end method

.method public w(I)Ll/od2;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/od2;->n:[I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    return-object p0
.end method

.method public x(I)Ll/od2;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/od2;->n:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    return-object p0
.end method

.method public y(Ljava/lang/Object;Ll/od2$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ll/od2$b<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/od2;->q:Ll/od2$b;

    .line 2
    .line 3
    iput-object p1, p0, Ll/od2;->s:Ljava/lang/Object;

    .line 4
    .line 5
    return-void
.end method

.method public z(Landroid/view/ViewGroup;)Ll/od2;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/od2;->j:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    :cond_0
    return-object p0
.end method
