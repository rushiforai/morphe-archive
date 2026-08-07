.class public Ll/r3d0;
.super Ll/s3d0;
.source "SourceFile"


# instance fields
.field public c:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/s3d0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/r3d0;->c:F

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public e()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/s3d0;->e()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/r3d0;->c:F

    .line 6
    .line 7
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Ll/s3d0;->b:I

    .line 3
    .line 4
    return-void
.end method

.method public h(I)V
    .locals 3

    .line 1
    iget v0, p0, Ll/s3d0;->b:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Ll/r3d0;->c:F

    .line 6
    .line 7
    int-to-float v2, p1

    .line 8
    cmpl-float v1, v1, v2

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void

    .line 14
    :cond_1
    :goto_0
    int-to-float p1, p1

    .line 15
    iput p1, p0, Ll/r3d0;->c:F

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    if-ne v0, p1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/s3d0;->c()V

    .line 21
    .line 22
    .line 23
    :cond_2
    invoke-virtual {p0}, Ll/s3d0;->b()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
