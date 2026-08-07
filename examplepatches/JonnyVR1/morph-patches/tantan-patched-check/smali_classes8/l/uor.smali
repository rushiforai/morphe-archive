.class public Ll/uor;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:[Ljava/lang/Object;

.field public c:[Ljava/lang/Object;

.field public volatile d:I

.field public e:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/uor;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/uor;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/uor;->a:I

    .line 8
    .line 9
    add-int/2addr v0, v2

    .line 10
    new-array v0, v0, [Ljava/lang/Object;

    .line 11
    .line 12
    iput-object v0, p0, Ll/uor;->b:[Ljava/lang/Object;

    .line 13
    .line 14
    iput-object v0, p0, Ll/uor;->c:[Ljava/lang/Object;

    .line 15
    .line 16
    aput-object p1, v0, v1

    .line 17
    .line 18
    iput v2, p0, Ll/uor;->e:I

    .line 19
    .line 20
    iput v2, p0, Ll/uor;->d:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget v0, p0, Ll/uor;->e:I

    .line 24
    .line 25
    iget v3, p0, Ll/uor;->a:I

    .line 26
    .line 27
    if-ne v0, v3, :cond_1

    .line 28
    .line 29
    add-int/lit8 v0, v3, 0x1

    .line 30
    .line 31
    new-array v0, v0, [Ljava/lang/Object;

    .line 32
    .line 33
    aput-object p1, v0, v1

    .line 34
    .line 35
    iget-object p1, p0, Ll/uor;->c:[Ljava/lang/Object;

    .line 36
    .line 37
    aput-object v0, p1, v3

    .line 38
    .line 39
    iput-object v0, p0, Ll/uor;->c:[Ljava/lang/Object;

    .line 40
    .line 41
    iput v2, p0, Ll/uor;->e:I

    .line 42
    .line 43
    iget p1, p0, Ll/uor;->d:I

    .line 44
    .line 45
    add-int/2addr p1, v2

    .line 46
    iput p1, p0, Ll/uor;->d:I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object v1, p0, Ll/uor;->c:[Ljava/lang/Object;

    .line 50
    .line 51
    aput-object p1, v1, v0

    .line 52
    .line 53
    add-int/2addr v0, v2

    .line 54
    iput v0, p0, Ll/uor;->e:I

    .line 55
    .line 56
    iget p1, p0, Ll/uor;->d:I

    .line 57
    .line 58
    add-int/2addr p1, v2

    .line 59
    iput p1, p0, Ll/uor;->d:I

    .line 60
    .line 61
    return-void
.end method

.method public b()[Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uor;->b:[Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/uor;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/uor;->a:I

    .line 2
    .line 3
    iget v1, p0, Ll/uor;->d:I

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    add-int/lit8 v3, v1, 0x1

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/uor;->b()[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v3, 0x0

    .line 17
    move v4, v3

    .line 18
    move v5, v4

    .line 19
    :cond_0
    :goto_0
    if-ge v4, v1, :cond_1

    .line 20
    .line 21
    aget-object v6, p0, v5

    .line 22
    .line 23
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    add-int/lit8 v4, v4, 0x1

    .line 27
    .line 28
    add-int/lit8 v5, v5, 0x1

    .line 29
    .line 30
    if-ne v5, v0, :cond_0

    .line 31
    .line 32
    aget-object p0, p0, v0

    .line 33
    .line 34
    check-cast p0, [Ljava/lang/Object;

    .line 35
    .line 36
    move v5, v3

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uor;->d()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
