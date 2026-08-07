.class public Landroidx/constraintlayout/solver/SolverVariable;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/SolverVariable$Type;
    }
.end annotation


# static fields
.field public static k:I = 0x1


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:I

.field public e:F

.field public f:[F

.field public g:Landroidx/constraintlayout/solver/SolverVariable$Type;

.field public h:[Landroidx/constraintlayout/solver/b;

.field public i:I

.field public j:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p2, -0x1

    .line 5
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 6
    .line 7
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 11
    .line 12
    const/4 v0, 0x7

    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->f:[F

    .line 16
    .line 17
    const/16 v0, 0x8

    .line 18
    .line 19
    new-array v0, v0, [Landroidx/constraintlayout/solver/b;

    .line 20
    .line 21
    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->h:[Landroidx/constraintlayout/solver/b;

    .line 22
    .line 23
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 24
    .line 25
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 26
    .line 27
    iput-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 28
    .line 29
    return-void
.end method

.method public static b()V
    .locals 1

    .line 1
    sget v0, Landroidx/constraintlayout/solver/SolverVariable;->k:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput v0, Landroidx/constraintlayout/solver/SolverVariable;->k:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a(Landroidx/constraintlayout/solver/b;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 3
    .line 4
    iget-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->h:[Landroidx/constraintlayout/solver/b;

    .line 5
    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    aget-object v1, v2, v0

    .line 9
    .line 10
    if-ne v1, p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    array-length v0, v2

    .line 17
    if-lt v1, v0, :cond_2

    .line 18
    .line 19
    array-length v0, v2

    .line 20
    mul-int/lit8 v0, v0, 0x2

    .line 21
    .line 22
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, [Landroidx/constraintlayout/solver/b;

    .line 27
    .line 28
    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->h:[Landroidx/constraintlayout/solver/b;

    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->h:[Landroidx/constraintlayout/solver/b;

    .line 31
    .line 32
    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 33
    .line 34
    aput-object p1, v0, v1

    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 39
    .line 40
    return-void
.end method

.method public final c(Landroidx/constraintlayout/solver/b;)V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    if-ge v2, v0, :cond_2

    .line 6
    .line 7
    iget-object v3, p0, Landroidx/constraintlayout/solver/SolverVariable;->h:[Landroidx/constraintlayout/solver/b;

    .line 8
    .line 9
    aget-object v3, v3, v2

    .line 10
    .line 11
    if-ne v3, p1, :cond_1

    .line 12
    .line 13
    :goto_1
    sub-int p1, v0, v2

    .line 14
    .line 15
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    if-ge v1, p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->h:[Landroidx/constraintlayout/solver/b;

    .line 20
    .line 21
    add-int v3, v2, v1

    .line 22
    .line 23
    add-int/lit8 v4, v3, 0x1

    .line 24
    .line 25
    aget-object v4, p1, v4

    .line 26
    .line 27
    aput-object v4, p1, v3

    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 33
    .line 34
    add-int/lit8 p1, p1, -0x1

    .line 35
    .line 36
    iput p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->a:Ljava/lang/String;

    .line 3
    .line 4
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNKNOWN:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 5
    .line 6
    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->d:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->b:I

    .line 13
    .line 14
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->c:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->e:F

    .line 18
    .line 19
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 20
    .line 21
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->j:I

    .line 22
    .line 23
    return-void
.end method

.method public e(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->g:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Landroidx/constraintlayout/solver/b;)V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    if-ge v2, v0, :cond_0

    .line 6
    .line 7
    iget-object v3, p0, Landroidx/constraintlayout/solver/SolverVariable;->h:[Landroidx/constraintlayout/solver/b;

    .line 8
    .line 9
    aget-object v3, v3, v2

    .line 10
    .line 11
    iget-object v4, v3, Landroidx/constraintlayout/solver/b;->d:Landroidx/constraintlayout/solver/a;

    .line 12
    .line 13
    invoke-virtual {v4, v3, p1, v1}, Landroidx/constraintlayout/solver/a;->n(Landroidx/constraintlayout/solver/b;Landroidx/constraintlayout/solver/b;Z)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->i:I

    .line 20
    .line 21
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Landroidx/constraintlayout/solver/SolverVariable;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
