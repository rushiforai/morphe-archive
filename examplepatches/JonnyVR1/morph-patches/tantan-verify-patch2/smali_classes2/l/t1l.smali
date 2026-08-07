.class public Ll/t1l;
.super Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
.source "SourceFile"


# instance fields
.field public v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public w0:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 6
    .line 7
    iput-object v0, p0, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/t1l;->w0:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public I0(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V
    .locals 3

    .line 1
    iget v0, p0, Ll/t1l;->w0:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iget-object v1, p0, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 6
    .line 7
    array-length v2, v1

    .line 8
    if-le v0, v2, :cond_0

    .line 9
    .line 10
    array-length v0, v1

    .line 11
    mul-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 18
    .line 19
    iput-object v0, p0, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/t1l;->v0:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 22
    .line 23
    iget v1, p0, Ll/t1l;->w0:I

    .line 24
    .line 25
    aput-object p1, v0, v1

    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    iput v1, p0, Ll/t1l;->w0:I

    .line 30
    .line 31
    return-void
.end method

.method public J0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/t1l;->w0:I

    .line 3
    .line 4
    return-void
.end method
