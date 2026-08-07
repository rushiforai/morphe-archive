.class public Ll/c4r0;
.super Ll/e4r0;
.source "SourceFile"


# instance fields
.field private a:Ll/l3r0;

.field private b:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/e4r0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l3r0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/l3r0;-><init>(I)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/c4r0;->a:Ll/l3r0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a([BII)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c4r0;->a:Ll/l3r0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l3r0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/c4r0;->a:Ll/l3r0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/l3r0;->k()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget v2, p0, Ll/c4r0;->b:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    if-le p3, v1, :cond_0

    .line 17
    .line 18
    iget-object p3, p0, Ll/c4r0;->a:Ll/l3r0;

    .line 19
    .line 20
    invoke-virtual {p3}, Ll/l3r0;->k()I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    iget v1, p0, Ll/c4r0;->b:I

    .line 25
    .line 26
    sub-int/2addr p3, v1

    .line 27
    :cond_0
    if-lez p3, :cond_1

    .line 28
    .line 29
    iget v1, p0, Ll/c4r0;->b:I

    .line 30
    .line 31
    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    iget p1, p0, Ll/c4r0;->b:I

    .line 35
    .line 36
    add-int/2addr p1, p3

    .line 37
    iput p1, p0, Ll/c4r0;->b:I

    .line 38
    .line 39
    :cond_1
    return p3
.end method

.method public c([BII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c4r0;->a:Ll/l3r0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c4r0;->a:Ll/l3r0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
