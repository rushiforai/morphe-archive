.class public Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/newui/view/MessageInputEditView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/String;


# virtual methods
.method public a(II)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a:I

    .line 2
    .line 3
    if-gt v0, p1, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 6
    .line 7
    if-lt p0, p2, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public b(I)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a:I

    .line 2
    .line 3
    sub-int v1, p1, v0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 6
    .line 7
    sub-int p1, p0, p1

    .line 8
    .line 9
    sub-int/2addr v1, p1

    .line 10
    if-ltz v1, :cond_0

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public c(II)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 6
    .line 7
    if-eq v1, p2, :cond_1

    .line 8
    .line 9
    :cond_0
    if-ne v0, p2, :cond_2

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 12
    .line 13
    if-ne p0, p1, :cond_2

    .line 14
    .line 15
    :cond_1
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_2
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public d(II)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a:I

    .line 2
    .line 3
    if-le p1, v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 6
    .line 7
    if-lt p1, v1, :cond_1

    .line 8
    .line 9
    :cond_0
    if-le p2, v0, :cond_2

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 12
    .line 13
    if-ge p2, p0, :cond_2

    .line 14
    .line 15
    :cond_1
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_2
    const/4 p0, 0x0

    .line 18
    return p0
.end method
