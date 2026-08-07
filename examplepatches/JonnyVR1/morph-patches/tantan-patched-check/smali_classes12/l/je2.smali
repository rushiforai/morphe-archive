.class public final Ll/je2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/je2;->a:I

    .line 5
    .line 6
    iput p4, p0, Ll/je2;->b:I

    .line 7
    .line 8
    iput p2, p0, Ll/je2;->c:I

    .line 9
    .line 10
    iput p3, p0, Ll/je2;->d:I

    .line 11
    .line 12
    add-int/2addr p2, p3

    .line 13
    iput p2, p0, Ll/je2;->e:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/je2;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/je2;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/je2;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/je2;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/je2;->c:I

    .line 2
    .line 3
    return p0
.end method
