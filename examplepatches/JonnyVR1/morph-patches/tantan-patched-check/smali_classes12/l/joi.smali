.class public final Ll/joi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:[I

.field public final c:[Ll/s5d0;


# direct methods
.method public constructor <init>(I[IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/joi;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/joi;->b:[I

    .line 7
    .line 8
    new-instance p1, Ll/s5d0;

    .line 9
    .line 10
    int-to-float p2, p3

    .line 11
    int-to-float p3, p5

    .line 12
    invoke-direct {p1, p2, p3}, Ll/s5d0;-><init>(FF)V

    .line 13
    .line 14
    .line 15
    new-instance p2, Ll/s5d0;

    .line 16
    .line 17
    int-to-float p4, p4

    .line 18
    invoke-direct {p2, p4, p3}, Ll/s5d0;-><init>(FF)V

    .line 19
    .line 20
    .line 21
    filled-new-array {p1, p2}, [Ll/s5d0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/joi;->c:[Ll/s5d0;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public a()[Ll/s5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/joi;->c:[Ll/s5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/joi;->b:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/joi;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Ll/joi;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Ll/joi;

    .line 8
    .line 9
    iget p0, p0, Ll/joi;->a:I

    .line 10
    .line 11
    iget p1, p1, Ll/joi;->a:I

    .line 12
    .line 13
    if-ne p0, p1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Ll/joi;->a:I

    .line 2
    .line 3
    return p0
.end method
