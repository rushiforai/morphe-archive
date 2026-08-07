.class public final Ll/f4z0;
.super Ll/mbu0;
.source "SourceFile"


# instance fields
.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public final y:Landroid/util/SparseArray;

.field public final z:Landroid/util/SparseBooleanArray;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 89
    invoke-direct {p0}, Ll/mbu0;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    .line 90
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Ll/f4z0;->y:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseBooleanArray;

    .line 91
    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Ll/f4z0;->z:Landroid/util/SparseBooleanArray;

    .line 92
    invoke-virtual {p0}, Ll/f4z0;->x()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 82
    invoke-direct {p0}, Ll/mbu0;-><init>()V

    .line 83
    invoke-super {p0, p1}, Ll/mbu0;->e(Landroid/content/Context;)Ll/mbu0;

    .line 84
    invoke-static {p1}, Ll/mpw0;->J(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object p1

    .line 85
    iget v0, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Ll/mbu0;->f(IIZ)Ll/mbu0;

    new-instance p1, Landroid/util/SparseArray;

    .line 86
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Ll/f4z0;->y:Landroid/util/SparseArray;

    new-instance p1, Landroid/util/SparseBooleanArray;

    .line 87
    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Ll/f4z0;->z:Landroid/util/SparseBooleanArray;

    .line 88
    invoke-virtual {p0}, Ll/f4z0;->x()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/h4z0;Ll/e4z0;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ll/mbu0;-><init>(Ll/scu0;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p1, Ll/h4z0;->k0:Z

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/f4z0;->r:Z

    .line 7
    .line 8
    iget-boolean p2, p1, Ll/h4z0;->m0:Z

    .line 9
    .line 10
    iput-boolean p2, p0, Ll/f4z0;->s:Z

    .line 11
    .line 12
    iget-boolean p2, p1, Ll/h4z0;->o0:Z

    .line 13
    .line 14
    iput-boolean p2, p0, Ll/f4z0;->t:Z

    .line 15
    .line 16
    iget-boolean p2, p1, Ll/h4z0;->t0:Z

    .line 17
    .line 18
    iput-boolean p2, p0, Ll/f4z0;->u:Z

    .line 19
    .line 20
    iget-boolean p2, p1, Ll/h4z0;->u0:Z

    .line 21
    .line 22
    iput-boolean p2, p0, Ll/f4z0;->v:Z

    .line 23
    .line 24
    iget-boolean p2, p1, Ll/h4z0;->v0:Z

    .line 25
    .line 26
    iput-boolean p2, p0, Ll/f4z0;->w:Z

    .line 27
    .line 28
    iget-boolean p2, p1, Ll/h4z0;->x0:Z

    .line 29
    .line 30
    iput-boolean p2, p0, Ll/f4z0;->x:Z

    .line 31
    .line 32
    invoke-static {p1}, Ll/h4z0;->a(Ll/h4z0;)Landroid/util/SparseArray;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    new-instance v0, Landroid/util/SparseArray;

    .line 37
    .line 38
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    :goto_0
    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-ge v1, v2, :cond_0

    .line 47
    .line 48
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    new-instance v3, Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Ljava/util/Map;

    .line 59
    .line 60
    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    iput-object v0, p0, Ll/f4z0;->y:Landroid/util/SparseArray;

    .line 70
    .line 71
    invoke-static {p1}, Ll/h4z0;->b(Ll/h4z0;)Landroid/util/SparseBooleanArray;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->clone()Landroid/util/SparseBooleanArray;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Ll/f4z0;->z:Landroid/util/SparseBooleanArray;

    .line 80
    .line 81
    return-void
.end method

.method public static bridge synthetic n(Ll/f4z0;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f4z0;->y:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic o(Ll/f4z0;)Landroid/util/SparseBooleanArray;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f4z0;->z:Landroid/util/SparseBooleanArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic q(Ll/f4z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f4z0;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic r(Ll/f4z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f4z0;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic s(Ll/f4z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f4z0;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic t(Ll/f4z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f4z0;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic u(Ll/f4z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f4z0;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic v(Ll/f4z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f4z0;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic w(Ll/f4z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f4z0;->r:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final synthetic f(IIZ)Ll/mbu0;
    .locals 0

    .line 1
    const/4 p3, 0x1

    .line 2
    invoke-super {p0, p1, p2, p3}, Ll/mbu0;->f(IIZ)Ll/mbu0;

    .line 3
    .line 4
    .line 5
    return-object p0
.end method

.method public final p(IZ)Ll/f4z0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f4z0;->z:Landroid/util/SparseBooleanArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/f4z0;->z:Landroid/util/SparseBooleanArray;

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    invoke-virtual {v0, p1, p2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public final x()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/f4z0;->r:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/f4z0;->s:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/f4z0;->t:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Ll/f4z0;->u:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/f4z0;->v:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Ll/f4z0;->w:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/f4z0;->x:Z

    .line 15
    .line 16
    return-void
.end method
