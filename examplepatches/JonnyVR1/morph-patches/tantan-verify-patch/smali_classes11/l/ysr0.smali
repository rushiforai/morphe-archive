.class public final Ll/ysr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:Z

.field public c:Z

.field public d:[B

.field public e:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ysr0;->a:I

    .line 5
    .line 6
    const/16 p1, 0x83

    .line 7
    .line 8
    new-array p1, p1, [B

    .line 9
    .line 10
    iput-object p1, p0, Ll/ysr0;->d:[B

    .line 11
    .line 12
    const/4 p0, 0x2

    .line 13
    const/4 p2, 0x1

    .line 14
    aput-byte p2, p1, p0

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a([BII)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ysr0;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sub-int/2addr p3, p2

    .line 7
    iget-object v0, p0, Ll/ysr0;->d:[B

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    iget v2, p0, Ll/ysr0;->e:I

    .line 11
    .line 12
    add-int/2addr v2, p3

    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    add-int/2addr v2, v2

    .line 16
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/ysr0;->d:[B

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/ysr0;->d:[B

    .line 23
    .line 24
    iget v1, p0, Ll/ysr0;->e:I

    .line 25
    .line 26
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    iget p1, p0, Ll/ysr0;->e:I

    .line 30
    .line 31
    add-int/2addr p1, p3

    .line 32
    iput p1, p0, Ll/ysr0;->e:I

    .line 33
    .line 34
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ysr0;->b:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/ysr0;->c:Z

    .line 5
    .line 6
    return-void
.end method

.method public final c(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ysr0;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Ll/ysr0;->a:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v1, v2

    .line 15
    :goto_0
    iput-boolean v1, p0, Ll/ysr0;->b:Z

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x3

    .line 20
    iput p1, p0, Ll/ysr0;->e:I

    .line 21
    .line 22
    iput-boolean v2, p0, Ll/ysr0;->c:Z

    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final d(I)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ysr0;->b:Z

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
    iget v0, p0, Ll/ysr0;->e:I

    .line 8
    .line 9
    sub-int/2addr v0, p1

    .line 10
    iput v0, p0, Ll/ysr0;->e:I

    .line 11
    .line 12
    iput-boolean v1, p0, Ll/ysr0;->b:Z

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Ll/ysr0;->c:Z

    .line 16
    .line 17
    return p1
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ysr0;->c:Z

    .line 2
    .line 3
    return p0
.end method
