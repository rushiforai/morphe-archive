.class public Ll/lc3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/lc3;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/lc3;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/lc3;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/lc3;->d:I

    .line 11
    .line 12
    return-void
.end method

.method public static b()Ll/lc3;
    .locals 2

    .line 1
    new-instance v0, Ll/lc3;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1, v1, v1}, Ll/lc3;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 2

    .line 1
    iget v0, p0, Ll/lc3;->a:I

    .line 2
    .line 3
    iget v1, p0, Ll/lc3;->b:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iget v1, p0, Ll/lc3;->c:I

    .line 7
    .line 8
    add-int/2addr v0, v1

    .line 9
    iget p0, p0, Ll/lc3;->d:I

    .line 10
    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public c(IIII)V
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Ll/lc3;->a:I

    .line 4
    .line 5
    :cond_0
    if-ltz p2, :cond_1

    .line 6
    .line 7
    iput p2, p0, Ll/lc3;->b:I

    .line 8
    .line 9
    :cond_1
    if-ltz p3, :cond_2

    .line 10
    .line 11
    iput p3, p0, Ll/lc3;->c:I

    .line 12
    .line 13
    :cond_2
    if-ltz p4, :cond_3

    .line 14
    .line 15
    iput p4, p0, Ll/lc3;->d:I

    .line 16
    .line 17
    :cond_3
    return-void
.end method
