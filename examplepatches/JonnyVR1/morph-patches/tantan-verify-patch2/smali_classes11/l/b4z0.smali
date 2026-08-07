.class public final Ll/b4z0;
.super Ll/h5z0;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(ILl/t2u0;ILl/h4z0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h5z0;-><init>(ILl/t2u0;I)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p4, Ll/h4z0;->v0:Z

    .line 5
    .line 6
    invoke-static {p5, p1}, Ll/l5z0;->t(IZ)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/b4z0;->e:I

    .line 11
    .line 12
    iget-object p1, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/sqr0;->a()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/b4z0;->f:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/b4z0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final bridge synthetic b(Ll/h5z0;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/b4z0;

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0
.end method

.method public final bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/b4z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b4z0;->f(Ll/b4z0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final f(Ll/b4z0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/b4z0;->f:I

    .line 2
    .line 3
    iget p1, p1, Ll/b4z0;->f:I

    .line 4
    .line 5
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
