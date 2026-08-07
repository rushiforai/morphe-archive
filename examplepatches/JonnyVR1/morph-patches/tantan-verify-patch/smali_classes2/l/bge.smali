.class public abstract Ll/bge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hr0$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bge$r;,
        Ll/bge$q;,
        Ll/bge$p;,
        Ll/bge$s;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/bge<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Ll/hr0$b;"
    }
.end annotation


# static fields
.field public static final m:Ll/bge$s;

.field public static final n:Ll/bge$s;

.field public static final o:Ll/bge$s;

.field public static final p:Ll/bge$s;

.field public static final q:Ll/bge$s;

.field public static final r:Ll/bge$s;

.field public static final s:Ll/bge$s;

.field public static final t:Ll/bge$s;

.field public static final u:Ll/bge$s;

.field public static final v:Ll/bge$s;

.field public static final w:Ll/bge$s;

.field public static final x:Ll/bge$s;

.field public static final y:Ll/bge$s;

.field public static final z:Ll/bge$s;


# instance fields
.field public a:F

.field public b:F

.field public c:Z

.field public final d:Ljava/lang/Object;

.field public final e:Ll/ysi;

.field public f:Z

.field public g:F

.field public h:F

.field public i:J

.field public j:F

.field public final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/bge$q;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/bge$r;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/bge$g;

    .line 2
    .line 3
    const-string v1, "translationX"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/bge$g;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/bge;->m:Ll/bge$s;

    .line 9
    .line 10
    new-instance v0, Ll/bge$h;

    .line 11
    .line 12
    const-string v1, "translationY"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/bge$h;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/bge;->n:Ll/bge$s;

    .line 18
    .line 19
    new-instance v0, Ll/bge$i;

    .line 20
    .line 21
    const-string v1, "translationZ"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/bge$i;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/bge;->o:Ll/bge$s;

    .line 27
    .line 28
    new-instance v0, Ll/bge$j;

    .line 29
    .line 30
    const-string v1, "scaleX"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ll/bge$j;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Ll/bge;->p:Ll/bge$s;

    .line 36
    .line 37
    new-instance v0, Ll/bge$k;

    .line 38
    .line 39
    const-string v1, "scaleY"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ll/bge$k;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Ll/bge;->q:Ll/bge$s;

    .line 45
    .line 46
    new-instance v0, Ll/bge$l;

    .line 47
    .line 48
    const-string v1, "rotation"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ll/bge$l;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Ll/bge;->r:Ll/bge$s;

    .line 54
    .line 55
    new-instance v0, Ll/bge$m;

    .line 56
    .line 57
    const-string v1, "rotationX"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ll/bge$m;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Ll/bge;->s:Ll/bge$s;

    .line 63
    .line 64
    new-instance v0, Ll/bge$n;

    .line 65
    .line 66
    const-string v1, "rotationY"

    .line 67
    .line 68
    invoke-direct {v0, v1}, Ll/bge$n;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Ll/bge;->t:Ll/bge$s;

    .line 72
    .line 73
    new-instance v0, Ll/bge$o;

    .line 74
    .line 75
    const-string v1, "x"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Ll/bge$o;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Ll/bge;->u:Ll/bge$s;

    .line 81
    .line 82
    new-instance v0, Ll/bge$a;

    .line 83
    .line 84
    const-string v1, "y"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Ll/bge$a;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Ll/bge;->v:Ll/bge$s;

    .line 90
    .line 91
    new-instance v0, Ll/bge$b;

    .line 92
    .line 93
    const-string v1, "z"

    .line 94
    .line 95
    invoke-direct {v0, v1}, Ll/bge$b;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Ll/bge;->w:Ll/bge$s;

    .line 99
    .line 100
    new-instance v0, Ll/bge$c;

    .line 101
    .line 102
    const-string v1, "alpha"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ll/bge$c;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object v0, Ll/bge;->x:Ll/bge$s;

    .line 108
    .line 109
    new-instance v0, Ll/bge$d;

    .line 110
    .line 111
    const-string v1, "scrollX"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ll/bge$d;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sput-object v0, Ll/bge;->y:Ll/bge$s;

    .line 117
    .line 118
    new-instance v0, Ll/bge$e;

    .line 119
    .line 120
    const-string v1, "scrollY"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Ll/bge$e;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Ll/bge;->z:Ll/bge$s;

    .line 126
    .line 127
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ll/ysi;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Ll/ysi<",
            "TK;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/bge;->a:F

    .line 6
    .line 7
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 8
    .line 9
    .line 10
    iput v0, p0, Ll/bge;->b:F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Ll/bge;->c:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Ll/bge;->f:Z

    .line 16
    .line 17
    iput v0, p0, Ll/bge;->g:F

    .line 18
    .line 19
    neg-float v0, v0

    .line 20
    iput v0, p0, Ll/bge;->h:F

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Ll/bge;->i:J

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/bge;->k:Ljava/util/ArrayList;

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/bge;->l:Ljava/util/ArrayList;

    .line 39
    .line 40
    iput-object p1, p0, Ll/bge;->d:Ljava/lang/Object;

    .line 41
    .line 42
    iput-object p2, p0, Ll/bge;->e:Ll/ysi;

    .line 43
    .line 44
    sget-object p1, Ll/bge;->r:Ll/bge$s;

    .line 45
    .line 46
    if-eq p2, p1, :cond_4

    .line 47
    .line 48
    sget-object p1, Ll/bge;->s:Ll/bge$s;

    .line 49
    .line 50
    if-eq p2, p1, :cond_4

    .line 51
    .line 52
    sget-object p1, Ll/bge;->t:Ll/bge$s;

    .line 53
    .line 54
    if-ne p2, p1, :cond_0

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    sget-object p1, Ll/bge;->x:Ll/bge$s;

    .line 58
    .line 59
    const/high16 v0, 0x3b800000    # 0.00390625f

    .line 60
    .line 61
    if-ne p2, p1, :cond_1

    .line 62
    .line 63
    iput v0, p0, Ll/bge;->j:F

    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    sget-object p1, Ll/bge;->p:Ll/bge$s;

    .line 67
    .line 68
    if-eq p2, p1, :cond_3

    .line 69
    .line 70
    sget-object p1, Ll/bge;->q:Ll/bge$s;

    .line 71
    .line 72
    if-ne p2, p1, :cond_2

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    .line 76
    .line 77
    iput p1, p0, Ll/bge;->j:F

    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    :goto_0
    iput v0, p0, Ll/bge;->j:F

    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    :goto_1
    const p1, 0x3dcccccd    # 0.1f

    .line 84
    .line 85
    .line 86
    iput p1, p0, Ll/bge;->j:F

    .line 87
    .line 88
    return-void
.end method

.method public constructor <init>(Ll/zsi;)V
    .locals 2

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 90
    iput v0, p0, Ll/bge;->a:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 91
    iput v0, p0, Ll/bge;->b:F

    const/4 v1, 0x0

    .line 92
    iput-boolean v1, p0, Ll/bge;->c:Z

    .line 93
    iput-boolean v1, p0, Ll/bge;->f:Z

    .line 94
    iput v0, p0, Ll/bge;->g:F

    neg-float v0, v0

    .line 95
    iput v0, p0, Ll/bge;->h:F

    const-wide/16 v0, 0x0

    .line 96
    iput-wide v0, p0, Ll/bge;->i:J

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/bge;->k:Ljava/util/ArrayList;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/bge;->l:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 99
    iput-object v0, p0, Ll/bge;->d:Ljava/lang/Object;

    .line 100
    new-instance v0, Ll/bge$f;

    const-string v1, "FloatValueHolder"

    invoke-direct {v0, p0, v1, p1}, Ll/bge$f;-><init>(Ll/bge;Ljava/lang/String;Ll/zsi;)V

    iput-object v0, p0, Ll/bge;->e:Ll/ysi;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 101
    iput p1, p0, Ll/bge;->j:F

    return-void
.end method

.method public static h(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return-void
.end method


# virtual methods
.method public a(J)Z
    .locals 4
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/bge;->i:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/bge;->i:J

    .line 11
    .line 12
    iget p1, p0, Ll/bge;->b:F

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/bge;->i(F)V

    .line 15
    .line 16
    .line 17
    return v3

    .line 18
    :cond_0
    sub-long v0, p1, v0

    .line 19
    .line 20
    iput-wide p1, p0, Ll/bge;->i:J

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Ll/bge;->n(J)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget p2, p0, Ll/bge;->b:F

    .line 27
    .line 28
    iget v0, p0, Ll/bge;->g:F

    .line 29
    .line 30
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, p0, Ll/bge;->b:F

    .line 35
    .line 36
    iget v0, p0, Ll/bge;->h:F

    .line 37
    .line 38
    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Ll/bge;->b:F

    .line 43
    .line 44
    invoke-virtual {p0, p2}, Ll/bge;->i(F)V

    .line 45
    .line 46
    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0, v3}, Ll/bge;->d(Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return p1
.end method

.method public b(Ll/bge$r;)Ll/bge;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bge$r;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bge;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/bge;->l:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/bge;->l:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p0

    .line 21
    :cond_1
    const-string p0, "Error: Update listeners must be added beforethe animation."

    .line 22
    .line 23
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/bge;->f:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Ll/bge;->d(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 21
    .line 22
    const-string v0, "Animations may only be canceled on the main thread"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method

.method public final d(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/bge;->f:Z

    .line 3
    .line 4
    invoke-static {}, Ll/hr0;->d()Ll/hr0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, p0}, Ll/hr0;->g(Ll/hr0$b;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    iput-wide v1, p0, Ll/bge;->i:J

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/bge;->c:Z

    .line 16
    .line 17
    :goto_0
    iget-object v1, p0, Ll/bge;->k:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, Ll/bge;->k:Ljava/util/ArrayList;

    .line 24
    .line 25
    if-ge v0, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Ll/bge;->k:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ll/bge$q;

    .line 40
    .line 41
    iget v2, p0, Ll/bge;->b:F

    .line 42
    .line 43
    iget v3, p0, Ll/bge;->a:F

    .line 44
    .line 45
    invoke-interface {v1, p0, p1, v2, v3}, Ll/bge$q;->onAnimationEnd(Ll/bge;ZFF)V

    .line 46
    .line 47
    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-static {v2}, Ll/bge;->h(Ljava/util/ArrayList;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final e()F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bge;->e:Ll/ysi;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bge;->d:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/ysi;->a(Ljava/lang/Object;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f()F
    .locals 1

    .line 1
    iget p0, p0, Ll/bge;->j:F

    .line 2
    .line 3
    const/high16 v0, 0x3f400000    # 0.75f

    .line 4
    .line 5
    mul-float/2addr p0, v0

    .line 6
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bge;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public i(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bge;->e:Ll/ysi;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bge;->d:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/ysi;->b(Ljava/lang/Object;F)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    :goto_0
    iget-object v0, p0, Ll/bge;->l:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/bge;->l:Ljava/util/ArrayList;

    .line 16
    .line 17
    if-ge p1, v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/bge;->l:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/bge$r;

    .line 32
    .line 33
    iget v1, p0, Ll/bge;->b:F

    .line 34
    .line 35
    iget v2, p0, Ll/bge;->a:F

    .line 36
    .line 37
    invoke-interface {v0, p0, v1, v2}, Ll/bge$r;->a(Ll/bge;FF)V

    .line 38
    .line 39
    .line 40
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-static {v1}, Ll/bge;->h(Ljava/util/ArrayList;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public j(F)Ll/bge;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Ll/bge;->b:F

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/bge;->c:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public k(F)Ll/bge;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Ll/bge;->a:F

    .line 2
    .line 3
    return-object p0
.end method

.method public l()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/bge;->f:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bge;->m()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 20
    .line 21
    const-string v0, "Animations may only be started on the main thread"

    .line 22
    .line 23
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/bge;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/bge;->f:Z

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/bge;->c:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/bge;->e()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/bge;->b:F

    .line 17
    .line 18
    :cond_0
    iget v0, p0, Ll/bge;->b:F

    .line 19
    .line 20
    iget v1, p0, Ll/bge;->g:F

    .line 21
    .line 22
    cmpl-float v1, v0, v1

    .line 23
    .line 24
    if-gtz v1, :cond_1

    .line 25
    .line 26
    iget v1, p0, Ll/bge;->h:F

    .line 27
    .line 28
    cmpg-float v0, v0, v1

    .line 29
    .line 30
    if-ltz v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ll/hr0;->d()Ll/hr0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-wide/16 v1, 0x0

    .line 37
    .line 38
    invoke-virtual {v0, p0, v1, v2}, Ll/hr0;->a(Ll/hr0$b;J)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const-string p0, "Starting value need to be in between min value and max value"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public abstract n(J)Z
.end method
