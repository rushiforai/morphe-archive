.class public Landroidx/constraintlayout/solver/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/c$a;
    }
.end annotation


# static fields
.field public static q:I = 0x3e8

.field public static r:Ll/pa00;


# instance fields
.field public a:I

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/solver/SolverVariable;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroidx/constraintlayout/solver/c$a;

.field public d:I

.field public e:I

.field public f:[Landroidx/constraintlayout/solver/b;

.field public g:Z

.field public h:[Z

.field public i:I

.field public j:I

.field public k:I

.field public final l:Ll/wx3;

.field public m:[Landroidx/constraintlayout/solver/SolverVariable;

.field public n:I

.field public o:[Landroidx/constraintlayout/solver/b;

.field public final p:Landroidx/constraintlayout/solver/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Landroidx/constraintlayout/solver/c;->b:Ljava/util/HashMap;

    .line 9
    .line 10
    const/16 v2, 0x20

    .line 11
    .line 12
    iput v2, p0, Landroidx/constraintlayout/solver/c;->d:I

    .line 13
    .line 14
    iput v2, p0, Landroidx/constraintlayout/solver/c;->e:I

    .line 15
    .line 16
    iput-object v1, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 17
    .line 18
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/c;->g:Z

    .line 19
    .line 20
    new-array v1, v2, [Z

    .line 21
    .line 22
    iput-object v1, p0, Landroidx/constraintlayout/solver/c;->h:[Z

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    iput v1, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 26
    .line 27
    iput v0, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 28
    .line 29
    iput v2, p0, Landroidx/constraintlayout/solver/c;->k:I

    .line 30
    .line 31
    sget v1, Landroidx/constraintlayout/solver/c;->q:I

    .line 32
    .line 33
    new-array v1, v1, [Landroidx/constraintlayout/solver/SolverVariable;

    .line 34
    .line 35
    iput-object v1, p0, Landroidx/constraintlayout/solver/c;->m:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 36
    .line 37
    iput v0, p0, Landroidx/constraintlayout/solver/c;->n:I

    .line 38
    .line 39
    new-array v0, v2, [Landroidx/constraintlayout/solver/b;

    .line 40
    .line 41
    iput-object v0, p0, Landroidx/constraintlayout/solver/c;->o:[Landroidx/constraintlayout/solver/b;

    .line 42
    .line 43
    new-array v0, v2, [Landroidx/constraintlayout/solver/b;

    .line 44
    .line 45
    iput-object v0, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->E()V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/wx3;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/wx3;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 56
    .line 57
    new-instance v1, Ll/c6k;

    .line 58
    .line 59
    invoke-direct {v1, v0}, Ll/c6k;-><init>(Ll/wx3;)V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Landroidx/constraintlayout/solver/c;->c:Landroidx/constraintlayout/solver/c$a;

    .line 63
    .line 64
    new-instance v1, Landroidx/constraintlayout/solver/b;

    .line 65
    .line 66
    invoke-direct {v1, v0}, Landroidx/constraintlayout/solver/b;-><init>(Ll/wx3;)V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Landroidx/constraintlayout/solver/c;->p:Landroidx/constraintlayout/solver/c$a;

    .line 70
    .line 71
    return-void
.end method

.method public static t(Landroidx/constraintlayout/solver/c;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;FZ)Landroidx/constraintlayout/solver/b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->g(Landroidx/constraintlayout/solver/b;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/constraintlayout/solver/b;->i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static y()Ll/pa00;
    .locals 1

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final A()V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/c;->d:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/c;->d:I

    .line 6
    .line 7
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 8
    .line 9
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, [Landroidx/constraintlayout/solver/b;

    .line 14
    .line 15
    iput-object v0, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 18
    .line 19
    iget-object v1, v0, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 20
    .line 21
    iget v2, p0, Landroidx/constraintlayout/solver/c;->d:I

    .line 22
    .line 23
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, [Landroidx/constraintlayout/solver/SolverVariable;

    .line 28
    .line 29
    iput-object v1, v0, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 30
    .line 31
    iget v0, p0, Landroidx/constraintlayout/solver/c;->d:I

    .line 32
    .line 33
    new-array v1, v0, [Z

    .line 34
    .line 35
    iput-object v1, p0, Landroidx/constraintlayout/solver/c;->h:[Z

    .line 36
    .line 37
    iput v0, p0, Landroidx/constraintlayout/solver/c;->e:I

    .line 38
    .line 39
    iput v0, p0, Landroidx/constraintlayout/solver/c;->k:I

    .line 40
    .line 41
    sget-object p0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 42
    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    iget-wide v1, p0, Ll/pa00;->d:J

    .line 46
    .line 47
    const-wide/16 v3, 0x1

    .line 48
    .line 49
    add-long/2addr v1, v3

    .line 50
    iput-wide v1, p0, Ll/pa00;->d:J

    .line 51
    .line 52
    iget-wide v1, p0, Ll/pa00;->p:J

    .line 53
    .line 54
    int-to-long v3, v0

    .line 55
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    iput-wide v0, p0, Ll/pa00;->p:J

    .line 60
    .line 61
    sget-object p0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 62
    .line 63
    iget-wide v0, p0, Ll/pa00;->p:J

    .line 64
    .line 65
    iput-wide v0, p0, Ll/pa00;->D:J

    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public B()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v3, v0, Ll/pa00;->e:J

    .line 8
    .line 9
    add-long/2addr v3, v1

    .line 10
    iput-wide v3, v0, Ll/pa00;->e:J

    .line 11
    .line 12
    :cond_0
    iget-boolean v3, p0, Landroidx/constraintlayout/solver/c;->g:Z

    .line 13
    .line 14
    if-eqz v3, :cond_5

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-wide v3, v0, Ll/pa00;->r:J

    .line 19
    .line 20
    add-long/2addr v3, v1

    .line 21
    iput-wide v3, v0, Ll/pa00;->r:J

    .line 22
    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    :goto_0
    iget v3, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 25
    .line 26
    if-ge v0, v3, :cond_3

    .line 27
    .line 28
    iget-object v3, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 29
    .line 30
    aget-object v3, v3, v0

    .line 31
    .line 32
    iget-boolean v3, v3, Landroidx/constraintlayout/solver/b;->e:Z

    .line 33
    .line 34
    if-nez v3, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->c:Landroidx/constraintlayout/solver/c$a;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->C(Landroidx/constraintlayout/solver/c$a;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    iget-wide v3, v0, Ll/pa00;->q:J

    .line 50
    .line 51
    add-long/2addr v3, v1

    .line 52
    iput-wide v3, v0, Ll/pa00;->q:J

    .line 53
    .line 54
    :cond_4
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->o()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_5
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->c:Landroidx/constraintlayout/solver/c$a;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->C(Landroidx/constraintlayout/solver/c$a;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public C(Landroidx/constraintlayout/solver/c$a;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v1, v0, Ll/pa00;->t:J

    .line 6
    .line 7
    const-wide/16 v3, 0x1

    .line 8
    .line 9
    add-long/2addr v1, v3

    .line 10
    iput-wide v1, v0, Ll/pa00;->t:J

    .line 11
    .line 12
    iget-wide v1, v0, Ll/pa00;->u:J

    .line 13
    .line 14
    iget v3, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 15
    .line 16
    int-to-long v3, v3

    .line 17
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    iput-wide v1, v0, Ll/pa00;->u:J

    .line 22
    .line 23
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 24
    .line 25
    iget-wide v1, v0, Ll/pa00;->v:J

    .line 26
    .line 27
    iget v3, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 28
    .line 29
    int-to-long v3, v3

    .line 30
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    iput-wide v1, v0, Ll/pa00;->v:J

    .line 35
    .line 36
    :cond_0
    move-object v0, p1

    .line 37
    check-cast v0, Landroidx/constraintlayout/solver/b;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->G(Landroidx/constraintlayout/solver/b;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/c;->v(Landroidx/constraintlayout/solver/c$a;)I

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/solver/c;->D(Landroidx/constraintlayout/solver/c$a;Z)I

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->o()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final D(Landroidx/constraintlayout/solver/c$a;Z)I
    .locals 13

    .line 1
    sget-object p2, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    const-wide/16 v0, 0x1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-wide v2, p2, Ll/pa00;->h:J

    .line 8
    .line 9
    add-long/2addr v2, v0

    .line 10
    iput-wide v2, p2, Ll/pa00;->h:J

    .line 11
    .line 12
    :cond_0
    const/4 p2, 0x0

    .line 13
    move v2, p2

    .line 14
    :goto_0
    iget v3, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 15
    .line 16
    if-ge v2, v3, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Landroidx/constraintlayout/solver/c;->h:[Z

    .line 19
    .line 20
    aput-boolean p2, v3, v2

    .line 21
    .line 22
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move v2, p2

    .line 26
    move v3, v2

    .line 27
    :goto_1
    if-nez v2, :cond_d

    .line 28
    .line 29
    sget-object v4, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 30
    .line 31
    if-eqz v4, :cond_2

    .line 32
    .line 33
    iget-wide v5, v4, Ll/pa00;->i:J

    .line 34
    .line 35
    add-long/2addr v5, v0

    .line 36
    iput-wide v5, v4, Ll/pa00;->i:J

    .line 37
    .line 38
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    iget v4, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 41
    .line 42
    mul-int/lit8 v4, v4, 0x2

    .line 43
    .line 44
    if-lt v3, v4, :cond_3

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    invoke-interface {p1}, Landroidx/constraintlayout/solver/c$a;->getKey()Landroidx/constraintlayout/solver/SolverVariable;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const/4 v5, 0x1

    .line 52
    if-eqz v4, :cond_4

    .line 53
    .line 54
    iget-object v4, p0, Landroidx/constraintlayout/solver/c;->h:[Z

    .line 55
    .line 56
    invoke-interface {p1}, Landroidx/constraintlayout/solver/c$a;->getKey()Landroidx/constraintlayout/solver/SolverVariable;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    iget v6, v6, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 61
    .line 62
    aput-boolean v5, v4, v6

    .line 63
    .line 64
    :cond_4
    iget-object v4, p0, Landroidx/constraintlayout/solver/c;->h:[Z

    .line 65
    .line 66
    invoke-interface {p1, p0, v4}, Landroidx/constraintlayout/solver/c$a;->b(Landroidx/constraintlayout/solver/c;[Z)Landroidx/constraintlayout/solver/SolverVariable;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    if-eqz v4, :cond_6

    .line 71
    .line 72
    iget-object v6, p0, Landroidx/constraintlayout/solver/c;->h:[Z

    .line 73
    .line 74
    iget v7, v4, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 75
    .line 76
    aget-boolean v8, v6, v7

    .line 77
    .line 78
    if-eqz v8, :cond_5

    .line 79
    .line 80
    :goto_2
    return v3

    .line 81
    :cond_5
    aput-boolean v5, v6, v7

    .line 82
    .line 83
    :cond_6
    if-eqz v4, :cond_c

    .line 84
    .line 85
    const/4 v6, -0x1

    .line 86
    const v7, 0x7f7fffff    # Float.MAX_VALUE

    .line 87
    .line 88
    .line 89
    move v8, p2

    .line 90
    move v9, v6

    .line 91
    :goto_3
    iget v10, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 92
    .line 93
    if-ge v8, v10, :cond_a

    .line 94
    .line 95
    iget-object v10, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 96
    .line 97
    aget-object v10, v10, v8

    .line 98
    .line 99
    iget-object v11, v10, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 100
    .line 101
    iget-object v11, v11, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 102
    .line 103
    sget-object v12, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 104
    .line 105
    if-ne v11, v12, :cond_7

    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_7
    iget-boolean v11, v10, Landroidx/constraintlayout/solver/b;->e:Z

    .line 109
    .line 110
    if-eqz v11, :cond_8

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_8
    invoke-virtual {v10, v4}, Landroidx/constraintlayout/solver/b;->s(Landroidx/constraintlayout/solver/SolverVariable;)Z

    .line 114
    .line 115
    .line 116
    move-result v11

    .line 117
    if-eqz v11, :cond_9

    .line 118
    .line 119
    iget-object v11, v10, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 120
    .line 121
    invoke-virtual {v11, v4}, Landroidx/constraintlayout/solver/a;->f(Landroidx/constraintlayout/solver/SolverVariable;)F

    .line 122
    .line 123
    .line 124
    move-result v11

    .line 125
    const/4 v12, 0x0

    .line 126
    cmpg-float v12, v11, v12

    .line 127
    .line 128
    if-gez v12, :cond_9

    .line 129
    .line 130
    iget v10, v10, Landroidx/constraintlayout/solver/b;->b:F

    .line 131
    .line 132
    neg-float v10, v10

    .line 133
    div-float/2addr v10, v11

    .line 134
    cmpg-float v11, v10, v7

    .line 135
    .line 136
    if-gez v11, :cond_9

    .line 137
    .line 138
    move v9, v8

    .line 139
    move v7, v10

    .line 140
    :cond_9
    :goto_4
    add-int/lit8 v8, v8, 0x1

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_a
    if-le v9, v6, :cond_c

    .line 144
    .line 145
    iget-object v5, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 146
    .line 147
    aget-object v5, v5, v9

    .line 148
    .line 149
    iget-object v7, v5, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 150
    .line 151
    iput v6, v7, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 152
    .line 153
    sget-object v6, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 154
    .line 155
    if-eqz v6, :cond_b

    .line 156
    .line 157
    iget-wide v7, v6, Ll/pa00;->j:J

    .line 158
    .line 159
    add-long/2addr v7, v0

    .line 160
    iput-wide v7, v6, Ll/pa00;->j:J

    .line 161
    .line 162
    :cond_b
    invoke-virtual {v5, v4}, Landroidx/constraintlayout/solver/b;->v(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 163
    .line 164
    .line 165
    iget-object v4, v5, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 166
    .line 167
    iput v9, v4, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 168
    .line 169
    invoke-virtual {v4, v5}, Landroidx/constraintlayout/solver/SolverVariable;->f(Landroidx/constraintlayout/solver/b;)V

    .line 170
    .line 171
    .line 172
    goto/16 :goto_1

    .line 173
    .line 174
    :cond_c
    move v2, v5

    .line 175
    goto/16 :goto_1

    .line 176
    .line 177
    :cond_d
    return v3
.end method

.method public final E()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 12
    .line 13
    iget-object v2, v2, Ll/wx3;->a:Ll/oj80;

    .line 14
    .line 15
    invoke-interface {v2, v1}, Ll/oj80;->release(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    aput-object v2, v1, v0

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method public F()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 4
    .line 5
    iget-object v3, v2, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    .line 7
    array-length v4, v3

    .line 8
    if-ge v1, v4, :cond_1

    .line 9
    .line 10
    aget-object v2, v3, v1

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/SolverVariable;->d()V

    .line 15
    .line 16
    .line 17
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v1, v2, Ll/wx3;->b:Ll/oj80;

    .line 21
    .line 22
    iget-object v2, p0, Landroidx/constraintlayout/solver/c;->m:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 23
    .line 24
    iget v3, p0, Landroidx/constraintlayout/solver/c;->n:I

    .line 25
    .line 26
    invoke-interface {v1, v2, v3}, Ll/oj80;->a([Ljava/lang/Object;I)V

    .line 27
    .line 28
    .line 29
    iput v0, p0, Landroidx/constraintlayout/solver/c;->n:I

    .line 30
    .line 31
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 32
    .line 33
    iget-object v1, v1, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->b:Ljava/util/HashMap;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 44
    .line 45
    .line 46
    :cond_2
    iput v0, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 47
    .line 48
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->c:Landroidx/constraintlayout/solver/c$a;

    .line 49
    .line 50
    invoke-interface {v1}, Landroidx/constraintlayout/solver/c$a;->clear()V

    .line 51
    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    iput v1, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 55
    .line 56
    move v1, v0

    .line 57
    :goto_1
    iget v2, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 58
    .line 59
    if-ge v1, v2, :cond_3

    .line 60
    .line 61
    iget-object v2, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 62
    .line 63
    aget-object v2, v2, v1

    .line 64
    .line 65
    iput-boolean v0, v2, Landroidx/constraintlayout/solver/b;->c:Z

    .line 66
    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->E()V

    .line 71
    .line 72
    .line 73
    iput v0, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 74
    .line 75
    return-void
.end method

.method public final G(Landroidx/constraintlayout/solver/b;)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p0}, Landroidx/constraintlayout/solver/a;->o(Landroidx/constraintlayout/solver/b;[Landroidx/constraintlayout/solver/b;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 13
    .line 14
    iget p0, p0, Landroidx/constraintlayout/solver/a;->a:I

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    iput-boolean p0, p1, Landroidx/constraintlayout/solver/b;->e:Z

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final a(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wx3;->b:Ll/oj80;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/oj80;->acquire()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroidx/constraintlayout/solver/SolverVariable;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Landroidx/constraintlayout/solver/SolverVariable;

    .line 14
    .line 15
    invoke-direct {v0, p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;-><init>(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->e(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/SolverVariable;->d()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->e(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget p1, p0, Landroidx/constraintlayout/solver/c;->n:I

    .line 29
    .line 30
    sget p2, Landroidx/constraintlayout/solver/c;->q:I

    .line 31
    .line 32
    if-lt p1, p2, :cond_1

    .line 33
    .line 34
    mul-int/lit8 p2, p2, 0x2

    .line 35
    .line 36
    sput p2, Landroidx/constraintlayout/solver/c;->q:I

    .line 37
    .line 38
    iget-object p1, p0, Landroidx/constraintlayout/solver/c;->m:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 39
    .line 40
    invoke-static {p1, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, [Landroidx/constraintlayout/solver/SolverVariable;

    .line 45
    .line 46
    iput-object p1, p0, Landroidx/constraintlayout/solver/c;->m:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Landroidx/constraintlayout/solver/c;->m:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 49
    .line 50
    iget p2, p0, Landroidx/constraintlayout/solver/c;->n:I

    .line 51
    .line 52
    add-int/lit8 v1, p2, 0x1

    .line 53
    .line 54
    iput v1, p0, Landroidx/constraintlayout/solver/c;->n:I

    .line 55
    .line 56
    aput-object v0, p1, p2

    .line 57
    .line 58
    return-object v0
.end method

.method public b(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;FI)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 8
    .line 9
    invoke-virtual {v1, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v0, v4}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 18
    .line 19
    invoke-virtual {v1, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {v0, v5}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 28
    .line 29
    invoke-virtual {v1, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-virtual {v0, v7}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 34
    .line 35
    .line 36
    move-result-object v13

    .line 37
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 38
    .line 39
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 44
    .line 45
    .line 46
    move-result-object v9

    .line 47
    invoke-virtual {v2, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v2, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 60
    .line 61
    .line 62
    move-result-object v10

    .line 63
    invoke-virtual {v2, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->h(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    move/from16 v2, p3

    .line 84
    .line 85
    float-to-double v4, v2

    .line 86
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 87
    .line 88
    .line 89
    move-result-wide v14

    .line 90
    move/from16 v2, p4

    .line 91
    .line 92
    move-object/from16 p1, v1

    .line 93
    .line 94
    int-to-double v1, v2

    .line 95
    mul-double/2addr v14, v1

    .line 96
    double-to-float v12, v14

    .line 97
    invoke-virtual/range {v7 .. v12}, Landroidx/constraintlayout/solver/b;->p(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v7}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 101
    .line 102
    .line 103
    move-wide v7, v4

    .line 104
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    .line 109
    .line 110
    .line 111
    move-result-wide v7

    .line 112
    mul-double/2addr v7, v1

    .line 113
    double-to-float v10, v7

    .line 114
    move-object/from16 v8, p1

    .line 115
    .line 116
    move-object v9, v3

    .line 117
    move-object v7, v13

    .line 118
    invoke-virtual/range {v5 .. v10}, Landroidx/constraintlayout/solver/b;->p(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v5}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public c(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V
    .locals 9

    .line 1
    move/from16 v0, p8

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    move-object v2, p1

    .line 8
    move-object v3, p2

    .line 9
    move v4, p3

    .line 10
    move v5, p4

    .line 11
    move-object v6, p5

    .line 12
    move-object v7, p6

    .line 13
    move/from16 v8, p7

    .line 14
    .line 15
    invoke-virtual/range {v1 .. v8}, Landroidx/constraintlayout/solver/b;->g(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x6

    .line 19
    if-eq v0, p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1, p0, v0}, Landroidx/constraintlayout/solver/b;->d(Landroidx/constraintlayout/solver/c;I)Landroidx/constraintlayout/solver/b;

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public d(Landroidx/constraintlayout/solver/b;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 6
    .line 7
    const-wide/16 v1, 0x1

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-wide v3, v0, Ll/pa00;->f:J

    .line 12
    .line 13
    add-long/2addr v3, v1

    .line 14
    iput-wide v3, v0, Ll/pa00;->f:J

    .line 15
    .line 16
    iget-boolean v3, p1, Landroidx/constraintlayout/solver/b;->e:Z

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    iget-wide v3, v0, Ll/pa00;->g:J

    .line 21
    .line 22
    add-long/2addr v3, v1

    .line 23
    iput-wide v3, v0, Ll/pa00;->g:J

    .line 24
    .line 25
    :cond_1
    iget v0, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    add-int/2addr v0, v3

    .line 29
    iget v4, p0, Landroidx/constraintlayout/solver/c;->k:I

    .line 30
    .line 31
    if-ge v0, v4, :cond_2

    .line 32
    .line 33
    iget v0, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 34
    .line 35
    add-int/2addr v0, v3

    .line 36
    iget v4, p0, Landroidx/constraintlayout/solver/c;->e:I

    .line 37
    .line 38
    if-lt v0, v4, :cond_3

    .line 39
    .line 40
    :cond_2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->A()V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-boolean v0, p1, Landroidx/constraintlayout/solver/b;->e:Z

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    if-nez v0, :cond_b

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/c;->G(Landroidx/constraintlayout/solver/b;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/b;->t()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_4
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/b;->q()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/solver/b;->f(Landroidx/constraintlayout/solver/c;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_8

    .line 66
    .line 67
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->q()Landroidx/constraintlayout/solver/SolverVariable;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p1, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/c;->m(Landroidx/constraintlayout/solver/b;)V

    .line 74
    .line 75
    .line 76
    iget-object v4, p0, Landroidx/constraintlayout/solver/c;->p:Landroidx/constraintlayout/solver/c$a;

    .line 77
    .line 78
    invoke-interface {v4, p1}, Landroidx/constraintlayout/solver/c$a;->a(Landroidx/constraintlayout/solver/c$a;)V

    .line 79
    .line 80
    .line 81
    iget-object v4, p0, Landroidx/constraintlayout/solver/c;->p:Landroidx/constraintlayout/solver/c$a;

    .line 82
    .line 83
    invoke-virtual {p0, v4, v3}, Landroidx/constraintlayout/solver/c;->D(Landroidx/constraintlayout/solver/c$a;Z)I

    .line 84
    .line 85
    .line 86
    iget v4, v0, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 87
    .line 88
    const/4 v5, -0x1

    .line 89
    if-ne v4, v5, :cond_9

    .line 90
    .line 91
    iget-object v4, p1, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 92
    .line 93
    if-ne v4, v0, :cond_6

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/b;->u(Landroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    sget-object v4, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 102
    .line 103
    if-eqz v4, :cond_5

    .line 104
    .line 105
    iget-wide v5, v4, Ll/pa00;->j:J

    .line 106
    .line 107
    add-long/2addr v5, v1

    .line 108
    iput-wide v5, v4, Ll/pa00;->j:J

    .line 109
    .line 110
    :cond_5
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/b;->v(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-boolean v0, p1, Landroidx/constraintlayout/solver/b;->e:Z

    .line 114
    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    iget-object v0, p1, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 118
    .line 119
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/SolverVariable;->f(Landroidx/constraintlayout/solver/b;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget v0, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 123
    .line 124
    sub-int/2addr v0, v3

    .line 125
    iput v0, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_8
    move v3, v4

    .line 129
    :cond_9
    :goto_0
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/b;->r()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_a

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_a
    move v4, v3

    .line 137
    :cond_b
    if-nez v4, :cond_c

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/c;->m(Landroidx/constraintlayout/solver/b;)V

    .line 140
    .line 141
    .line 142
    :cond_c
    :goto_1
    return-void
.end method

.method public e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p2, p3}, Landroidx/constraintlayout/solver/b;->m(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x6

    .line 9
    if-eq p4, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0, p4}, Landroidx/constraintlayout/solver/b;->d(Landroidx/constraintlayout/solver/c;I)Landroidx/constraintlayout/solver/b;

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public f(Landroidx/constraintlayout/solver/SolverVariable;I)V
    .locals 2

    .line 1
    iget v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_2

    .line 5
    .line 6
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 7
    .line 8
    aget-object v0, v1, v0

    .line 9
    .line 10
    iget-boolean v1, v0, Landroidx/constraintlayout/solver/b;->e:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    int-to-float p0, p2

    .line 15
    iput p0, v0, Landroidx/constraintlayout/solver/b;->b:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v1, v0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 19
    .line 20
    iget v1, v1, Landroidx/constraintlayout/solver/a;->a:I

    .line 21
    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    iput-boolean p0, v0, Landroidx/constraintlayout/solver/b;->e:Z

    .line 26
    .line 27
    int-to-float p0, p2

    .line 28
    iput p0, v0, Landroidx/constraintlayout/solver/b;->b:F

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/solver/b;->l(Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/solver/b;->h(Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final g(Landroidx/constraintlayout/solver/b;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, p0, v0}, Landroidx/constraintlayout/solver/b;->d(Landroidx/constraintlayout/solver/c;I)Landroidx/constraintlayout/solver/b;

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->u()Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    iput v2, v1, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, v1, v2}, Landroidx/constraintlayout/solver/b;->n(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 13
    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    iget-object p1, v0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/a;->f(Landroidx/constraintlayout/solver/SolverVariable;)F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/high16 p2, -0x40800000    # -1.0f

    .line 24
    .line 25
    mul-float/2addr p1, p2

    .line 26
    float-to-int p1, p1

    .line 27
    const/4 p2, 0x1

    .line 28
    invoke-virtual {p0, v0, p1, p2}, Landroidx/constraintlayout/solver/c;->n(Landroidx/constraintlayout/solver/b;II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public i(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->u()Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    iput v2, v1, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, v1, p3}, Landroidx/constraintlayout/solver/b;->n(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x6

    .line 16
    if-eq p4, p1, :cond_0

    .line 17
    .line 18
    iget-object p1, v0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/a;->f(Landroidx/constraintlayout/solver/SolverVariable;)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/high16 p2, -0x40800000    # -1.0f

    .line 25
    .line 26
    mul-float/2addr p1, p2

    .line 27
    float-to-int p1, p1

    .line 28
    invoke-virtual {p0, v0, p1, p4}, Landroidx/constraintlayout/solver/c;->n(Landroidx/constraintlayout/solver/b;II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public j(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->u()Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    iput v2, v1, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, v1, v2}, Landroidx/constraintlayout/solver/b;->o(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 13
    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    iget-object p1, v0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/a;->f(Landroidx/constraintlayout/solver/SolverVariable;)F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/high16 p2, -0x40800000    # -1.0f

    .line 24
    .line 25
    mul-float/2addr p1, p2

    .line 26
    float-to-int p1, p1

    .line 27
    const/4 p2, 0x1

    .line 28
    invoke-virtual {p0, v0, p1, p2}, Landroidx/constraintlayout/solver/c;->n(Landroidx/constraintlayout/solver/b;II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public k(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->u()Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    iput v2, v1, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, v1, p3}, Landroidx/constraintlayout/solver/b;->o(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x6

    .line 16
    if-eq p4, p1, :cond_0

    .line 17
    .line 18
    iget-object p1, v0, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/a;->f(Landroidx/constraintlayout/solver/SolverVariable;)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/high16 p2, -0x40800000    # -1.0f

    .line 25
    .line 26
    mul-float/2addr p1, p2

    .line 27
    float-to-int p1, p1

    .line 28
    invoke-virtual {p0, v0, p1, p4}, Landroidx/constraintlayout/solver/c;->n(Landroidx/constraintlayout/solver/b;II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public l(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;FI)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->s()Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move v5, p5

    .line 10
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/solver/b;->j(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/b;

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x6

    .line 14
    if-eq p6, p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, p0, p6}, Landroidx/constraintlayout/solver/b;->d(Landroidx/constraintlayout/solver/c;I)Landroidx/constraintlayout/solver/b;

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/c;->d(Landroidx/constraintlayout/solver/b;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final m(Landroidx/constraintlayout/solver/b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 2
    .line 3
    iget v1, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 4
    .line 5
    aget-object v0, v0, v1

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 10
    .line 11
    iget-object v1, v1, Ll/wx3;->a:Ll/oj80;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ll/oj80;->release(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 17
    .line 18
    iget v1, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 19
    .line 20
    aput-object p1, v0, v1

    .line 21
    .line 22
    iget-object v0, p1, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 23
    .line 24
    iput v1, v0, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    iput v1, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/SolverVariable;->f(Landroidx/constraintlayout/solver/b;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public n(Landroidx/constraintlayout/solver/b;II)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p3, v0}, Landroidx/constraintlayout/solver/c;->p(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1, p0, p2}, Landroidx/constraintlayout/solver/b;->e(Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/b;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Landroidx/constraintlayout/solver/c;->j:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 7
    .line 8
    aget-object v1, v1, v0

    .line 9
    .line 10
    iget-object v2, v1, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 11
    .line 12
    iget v1, v1, Landroidx/constraintlayout/solver/b;->b:F

    .line 13
    .line 14
    iput v1, v2, Landroidx/constraintlayout/solver/SolverVariable;->e:F

    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public p(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 5

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v1, v0, Ll/pa00;->m:J

    .line 6
    .line 7
    const-wide/16 v3, 0x1

    .line 8
    .line 9
    add-long/2addr v1, v3

    .line 10
    iput-wide v1, v0, Ll/pa00;->m:J

    .line 11
    .line 12
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iget v1, p0, Landroidx/constraintlayout/solver/c;->e:I

    .line 17
    .line 18
    if-lt v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->A()V

    .line 21
    .line 22
    .line 23
    :cond_1
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$Type;->ERROR:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 24
    .line 25
    invoke-virtual {p0, v0, p2}, Landroidx/constraintlayout/solver/c;->a(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget v0, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    iput v0, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 34
    .line 35
    iget v1, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 36
    .line 37
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    iput v1, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 40
    .line 41
    iput v0, p2, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 42
    .line 43
    iput p1, p2, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 44
    .line 45
    iget-object p1, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 46
    .line 47
    iget-object p1, p1, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 48
    .line 49
    aput-object p2, p1, v0

    .line 50
    .line 51
    iget-object p0, p0, Landroidx/constraintlayout/solver/c;->c:Landroidx/constraintlayout/solver/c$a;

    .line 52
    .line 53
    invoke-interface {p0, p2}, Landroidx/constraintlayout/solver/c$a;->c(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 54
    .line 55
    .line 56
    return-object p2
.end method

.method public q()Landroidx/constraintlayout/solver/SolverVariable;
    .locals 5

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v1, v0, Ll/pa00;->o:J

    .line 6
    .line 7
    const-wide/16 v3, 0x1

    .line 8
    .line 9
    add-long/2addr v1, v3

    .line 10
    iput-wide v1, v0, Ll/pa00;->o:J

    .line 11
    .line 12
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iget v1, p0, Landroidx/constraintlayout/solver/c;->e:I

    .line 17
    .line 18
    if-lt v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->A()V

    .line 21
    .line 22
    .line 23
    :cond_1
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$Type;->SLACK:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/solver/c;->a(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget v1, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    iput v1, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 35
    .line 36
    iget v2, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    iput v2, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 41
    .line 42
    iput v1, v0, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 43
    .line 44
    iget-object p0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 45
    .line 46
    iget-object p0, p0, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 47
    .line 48
    aput-object v0, p0, v1

    .line 49
    .line 50
    return-object v0
.end method

.method public r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iget v2, p0, Landroidx/constraintlayout/solver/c;->e:I

    .line 10
    .line 11
    if-lt v1, v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->A()V

    .line 14
    .line 15
    .line 16
    :cond_1
    instance-of v1, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 17
    .line 18
    if-eqz v1, :cond_6

    .line 19
    .line 20
    check-cast p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->g()Landroidx/constraintlayout/solver/SolverVariable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->n(Ll/wx3;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->g()Landroidx/constraintlayout/solver/SolverVariable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :cond_2
    iget p1, v0, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 38
    .line 39
    const/4 v1, -0x1

    .line 40
    if-eq p1, v1, :cond_4

    .line 41
    .line 42
    iget v2, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 43
    .line 44
    if-gt p1, v2, :cond_4

    .line 45
    .line 46
    iget-object v2, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 47
    .line 48
    iget-object v2, v2, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 49
    .line 50
    aget-object v2, v2, p1

    .line 51
    .line 52
    if-nez v2, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    return-object v0

    .line 56
    :cond_4
    :goto_0
    if-eq p1, v1, :cond_5

    .line 57
    .line 58
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/SolverVariable;->d()V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget p1, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 62
    .line 63
    add-int/lit8 p1, p1, 0x1

    .line 64
    .line 65
    iput p1, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 66
    .line 67
    iget v1, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 68
    .line 69
    add-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    iput v1, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 72
    .line 73
    iput p1, v0, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 74
    .line 75
    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 76
    .line 77
    iput-object v1, v0, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 78
    .line 79
    iget-object p0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 80
    .line 81
    iget-object p0, p0, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 82
    .line 83
    aput-object v0, p0, p1

    .line 84
    .line 85
    :cond_6
    return-object v0
.end method

.method public s()Landroidx/constraintlayout/solver/b;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wx3;->a:Ll/oj80;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/oj80;->acquire()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroidx/constraintlayout/solver/b;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Landroidx/constraintlayout/solver/b;

    .line 14
    .line 15
    iget-object p0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Landroidx/constraintlayout/solver/b;-><init>(Ll/wx3;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/b;->w()V

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-static {}, Landroidx/constraintlayout/solver/SolverVariable;->b()V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public u()Landroidx/constraintlayout/solver/SolverVariable;
    .locals 5

    .line 1
    sget-object v0, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v1, v0, Ll/pa00;->n:J

    .line 6
    .line 7
    const-wide/16 v3, 0x1

    .line 8
    .line 9
    add-long/2addr v1, v3

    .line 10
    iput-wide v1, v0, Ll/pa00;->n:J

    .line 11
    .line 12
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iget v1, p0, Landroidx/constraintlayout/solver/c;->e:I

    .line 17
    .line 18
    if-lt v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/c;->A()V

    .line 21
    .line 22
    .line 23
    :cond_1
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$Type;->SLACK:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/solver/c;->a(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget v1, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    iput v1, p0, Landroidx/constraintlayout/solver/c;->a:I

    .line 35
    .line 36
    iget v2, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    iput v2, p0, Landroidx/constraintlayout/solver/c;->i:I

    .line 41
    .line 42
    iput v1, v0, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 43
    .line 44
    iget-object p0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 45
    .line 46
    iget-object p0, p0, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 47
    .line 48
    aput-object v0, p0, v1

    .line 49
    .line 50
    return-object v0
.end method

.method public final v(Landroidx/constraintlayout/solver/c$a;)I
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :goto_0
    iget v3, v0, Landroidx/constraintlayout/solver/c;->j:I

    .line 5
    .line 6
    if-ge v2, v3, :cond_10

    .line 7
    .line 8
    iget-object v3, v0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 9
    .line 10
    aget-object v3, v3, v2

    .line 11
    .line 12
    iget-object v4, v3, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 13
    .line 14
    iget-object v4, v4, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 15
    .line 16
    sget-object v5, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 17
    .line 18
    if-ne v4, v5, :cond_1

    .line 19
    .line 20
    :cond_0
    const/16 p1, 0x0

    .line 21
    .line 22
    goto/16 :goto_8

    .line 23
    .line 24
    :cond_1
    iget v3, v3, Landroidx/constraintlayout/solver/b;->b:F

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    cmpg-float v3, v3, v4

    .line 28
    .line 29
    if-gez v3, :cond_0

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x0

    .line 33
    :goto_1
    if-nez v2, :cond_f

    .line 34
    .line 35
    sget-object v5, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 36
    .line 37
    const-wide/16 v6, 0x1

    .line 38
    .line 39
    if-eqz v5, :cond_2

    .line 40
    .line 41
    iget-wide v8, v5, Ll/pa00;->k:J

    .line 42
    .line 43
    add-long/2addr v8, v6

    .line 44
    iput-wide v8, v5, Ll/pa00;->k:J

    .line 45
    .line 46
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    const/4 v5, -0x1

    .line 49
    const v8, 0x7f7fffff    # Float.MAX_VALUE

    .line 50
    .line 51
    .line 52
    move v10, v5

    .line 53
    move v11, v10

    .line 54
    const/4 v9, 0x0

    .line 55
    const/4 v12, 0x0

    .line 56
    :goto_2
    iget v13, v0, Landroidx/constraintlayout/solver/c;->j:I

    .line 57
    .line 58
    const/4 v14, 0x1

    .line 59
    if-ge v9, v13, :cond_b

    .line 60
    .line 61
    iget-object v13, v0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 62
    .line 63
    aget-object v13, v13, v9

    .line 64
    .line 65
    iget-object v15, v13, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 66
    .line 67
    iget-object v15, v15, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 68
    .line 69
    const/16 p1, 0x0

    .line 70
    .line 71
    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 72
    .line 73
    if-ne v15, v1, :cond_3

    .line 74
    .line 75
    goto :goto_6

    .line 76
    :cond_3
    iget-boolean v1, v13, Landroidx/constraintlayout/solver/b;->e:Z

    .line 77
    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    goto :goto_6

    .line 81
    :cond_4
    iget v1, v13, Landroidx/constraintlayout/solver/b;->b:F

    .line 82
    .line 83
    cmpg-float v1, v1, v4

    .line 84
    .line 85
    if-gez v1, :cond_a

    .line 86
    .line 87
    :goto_3
    iget v1, v0, Landroidx/constraintlayout/solver/c;->i:I

    .line 88
    .line 89
    if-ge v14, v1, :cond_a

    .line 90
    .line 91
    iget-object v1, v0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 92
    .line 93
    iget-object v1, v1, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 94
    .line 95
    aget-object v1, v1, v14

    .line 96
    .line 97
    iget-object v15, v13, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 98
    .line 99
    invoke-virtual {v15, v1}, Landroidx/constraintlayout/solver/a;->f(Landroidx/constraintlayout/solver/SolverVariable;)F

    .line 100
    .line 101
    .line 102
    move-result v15

    .line 103
    cmpg-float v16, v15, v4

    .line 104
    .line 105
    if-gtz v16, :cond_5

    .line 106
    .line 107
    move-wide/from16 v17, v6

    .line 108
    .line 109
    goto :goto_5

    .line 110
    :cond_5
    move/from16 v4, p1

    .line 111
    .line 112
    move-wide/from16 v17, v6

    .line 113
    .line 114
    :goto_4
    const/4 v6, 0x7

    .line 115
    if-ge v4, v6, :cond_9

    .line 116
    .line 117
    iget-object v6, v1, Landroidx/constraintlayout/solver/SolverVariable;->f:[F

    .line 118
    .line 119
    aget v6, v6, v4

    .line 120
    .line 121
    div-float/2addr v6, v15

    .line 122
    cmpg-float v7, v6, v8

    .line 123
    .line 124
    if-gez v7, :cond_6

    .line 125
    .line 126
    if-eq v4, v12, :cond_7

    .line 127
    .line 128
    :cond_6
    if-le v4, v12, :cond_8

    .line 129
    .line 130
    :cond_7
    move v12, v4

    .line 131
    move v8, v6

    .line 132
    move v10, v9

    .line 133
    move v11, v14

    .line 134
    :cond_8
    add-int/lit8 v4, v4, 0x1

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_9
    :goto_5
    add-int/lit8 v14, v14, 0x1

    .line 138
    .line 139
    move-wide/from16 v6, v17

    .line 140
    .line 141
    const/4 v4, 0x0

    .line 142
    goto :goto_3

    .line 143
    :cond_a
    :goto_6
    move-wide/from16 v17, v6

    .line 144
    .line 145
    add-int/lit8 v9, v9, 0x1

    .line 146
    .line 147
    move-wide/from16 v6, v17

    .line 148
    .line 149
    const/4 v4, 0x0

    .line 150
    goto :goto_2

    .line 151
    :cond_b
    move-wide/from16 v17, v6

    .line 152
    .line 153
    const/16 p1, 0x0

    .line 154
    .line 155
    if-eq v10, v5, :cond_d

    .line 156
    .line 157
    iget-object v1, v0, Landroidx/constraintlayout/solver/c;->f:[Landroidx/constraintlayout/solver/b;

    .line 158
    .line 159
    aget-object v1, v1, v10

    .line 160
    .line 161
    iget-object v4, v1, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 162
    .line 163
    iput v5, v4, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 164
    .line 165
    sget-object v4, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 166
    .line 167
    if-eqz v4, :cond_c

    .line 168
    .line 169
    iget-wide v5, v4, Ll/pa00;->j:J

    .line 170
    .line 171
    add-long v5, v5, v17

    .line 172
    .line 173
    iput-wide v5, v4, Ll/pa00;->j:J

    .line 174
    .line 175
    :cond_c
    iget-object v4, v0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 176
    .line 177
    iget-object v4, v4, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 178
    .line 179
    aget-object v4, v4, v11

    .line 180
    .line 181
    invoke-virtual {v1, v4}, Landroidx/constraintlayout/solver/b;->v(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 182
    .line 183
    .line 184
    iget-object v4, v1, Landroidx/constraintlayout/solver/b;->a:Landroidx/constraintlayout/solver/SolverVariable;

    .line 185
    .line 186
    iput v10, v4, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 187
    .line 188
    invoke-virtual {v4, v1}, Landroidx/constraintlayout/solver/SolverVariable;->f(Landroidx/constraintlayout/solver/b;)V

    .line 189
    .line 190
    .line 191
    goto :goto_7

    .line 192
    :cond_d
    move v2, v14

    .line 193
    :goto_7
    iget v1, v0, Landroidx/constraintlayout/solver/c;->i:I

    .line 194
    .line 195
    div-int/lit8 v1, v1, 0x2

    .line 196
    .line 197
    if-le v3, v1, :cond_e

    .line 198
    .line 199
    move v2, v14

    .line 200
    :cond_e
    const/4 v4, 0x0

    .line 201
    goto/16 :goto_1

    .line 202
    .line 203
    :cond_f
    return v3

    .line 204
    :goto_8
    add-int/lit8 v2, v2, 0x1

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_10
    const/16 p1, 0x0

    .line 209
    .line 210
    return p1
.end method

.method public w(Ll/pa00;)V
    .locals 0

    .line 1
    sput-object p1, Landroidx/constraintlayout/solver/c;->r:Ll/pa00;

    .line 2
    .line 3
    return-void
.end method

.method public x()Ll/wx3;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/c;->l:Ll/wx3;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->g()Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Landroidx/constraintlayout/solver/SolverVariable;->e:F

    .line 10
    .line 11
    const/high16 p1, 0x3f000000    # 0.5f

    .line 12
    .line 13
    add-float/2addr p0, p1

    .line 14
    float-to-int p0, p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
