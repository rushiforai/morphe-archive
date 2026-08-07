.class public Ll/wx3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/oj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/oj80<",
            "Landroidx/constraintlayout/solver/b;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/oj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/oj80<",
            "Landroidx/constraintlayout/solver/SolverVariable;",
            ">;"
        }
    .end annotation
.end field

.field public c:[Landroidx/constraintlayout/solver/SolverVariable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qj80;

    .line 5
    .line 6
    const/16 v1, 0x100

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/qj80;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/wx3;->a:Ll/oj80;

    .line 12
    .line 13
    new-instance v0, Ll/qj80;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/qj80;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/wx3;->b:Ll/oj80;

    .line 19
    .line 20
    const/16 v0, 0x20

    .line 21
    .line 22
    new-array v0, v0, [Landroidx/constraintlayout/solver/SolverVariable;

    .line 23
    .line 24
    iput-object v0, p0, Ll/wx3;->c:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 25
    .line 26
    return-void
.end method
