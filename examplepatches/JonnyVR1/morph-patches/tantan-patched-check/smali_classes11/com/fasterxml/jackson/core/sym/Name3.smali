.class public final Lcom/fasterxml/jackson/core/sym/Name3;
.super Lcom/fasterxml/jackson/core/sym/Name;
.source "SourceFile"


# instance fields
.field private final q1:I

.field private final q2:I

.field private final q3:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIII)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/sym/Name;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/fasterxml/jackson/core/sym/Name3;->q1:I

    .line 5
    .line 6
    iput p4, p0, Lcom/fasterxml/jackson/core/sym/Name3;->q2:I

    .line 7
    .line 8
    iput p5, p0, Lcom/fasterxml/jackson/core/sym/Name3;->q3:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public equals(I)Z
    .locals 0

    .line 28
    const/4 p0, 0x0

    return p0
.end method

.method public equals(II)Z
    .locals 0

    .line 27
    const/4 p0, 0x0

    return p0
.end method

.method public equals([II)Z
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    aget p2, p1, v1

    .line 6
    .line 7
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/Name3;->q1:I

    .line 8
    .line 9
    if-ne p2, v0, :cond_0

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    aget v0, p1, p2

    .line 13
    .line 14
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/Name3;->q2:I

    .line 15
    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    aget p1, p1, v0

    .line 20
    .line 21
    iget p0, p0, Lcom/fasterxml/jackson/core/sym/Name3;->q3:I

    .line 22
    .line 23
    if-ne p1, p0, :cond_0

    .line 24
    .line 25
    return p2

    .line 26
    :cond_0
    return v1
.end method
