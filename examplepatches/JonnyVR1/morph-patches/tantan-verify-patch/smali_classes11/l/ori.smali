.class public final Ll/ori;
.super Ll/es2;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final h:I

.field public final i:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dfj0;II)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 13
    invoke-direct/range {v0 .. v5}, Ll/ori;-><init>(Ll/dfj0;IIILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Ll/dfj0;IIILjava/lang/Object;)V
    .locals 0
    .param p5    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    filled-new-array {p2}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0, p1, p2, p3}, Ll/es2;-><init>(Ll/dfj0;[II)V

    .line 6
    .line 7
    .line 8
    iput p4, p0, Ll/ori;->h:I

    .line 9
    .line 10
    iput-object p5, p0, Ll/ori;->i:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(JJJLjava/util/List;[Ll/drx;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJ",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;[",
            "Ll/drx;",
            ")V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public o()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ori;->i:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ori;->h:I

    .line 2
    .line 3
    return p0
.end method
