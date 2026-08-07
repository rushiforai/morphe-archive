.class public Ll/pqq0;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field private a:Ll/h6j;

.field private b:Ll/h6j;

.field private c:Ll/oqq0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h6j;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/h6j;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pqq0;->b:Ll/h6j;

    .line 10
    .line 11
    new-instance v0, Ll/h6j;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/h6j;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/pqq0;->a:Ll/h6j;

    .line 17
    .line 18
    new-instance v0, Ll/oqq0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/oqq0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 24
    .line 25
    iget-object v1, p0, Ll/pqq0;->b:Ll/h6j;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/pqq0;->a:Ll/h6j;

    .line 31
    .line 32
    iget-object v1, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/pqq0;->b:Ll/h6j;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 46
    .line 47
    iget-object v1, p0, Ll/pqq0;->a:Ll/h6j;

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {v0, v1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/pqq0;->b:Ll/h6j;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/pqq0;->a:Ll/h6j;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ll/oqq0;->d2(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 79
    .line 80
    const/high16 v0, 0x3f800000    # 1.0f

    .line 81
    .line 82
    invoke-virtual {p0, v0, v0, v0, v0}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 83
    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public Q1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->R1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->T1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->U1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->V1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public U1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->W1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->X1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->Y1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->Z1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->a2(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pqq0;->b:Ll/h6j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/pqq0;->a:Ll/h6j;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/pqq0;->a:Ll/h6j;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, Ll/oqq0;->d2(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public a2(ZI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/oqq0;->b2(ZI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b2(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqq0;->c:Ll/oqq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oqq0;->c2(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
