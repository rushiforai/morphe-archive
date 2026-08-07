.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(II)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 2
    .line 3
    if-gt v0, p1, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

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
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 2
    .line 3
    sub-int v1, p1, v0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

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
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 6
    .line 7
    if-eq v1, p2, :cond_1

    .line 8
    .line 9
    :cond_0
    if-ne v0, p2, :cond_2

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

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
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 2
    .line 3
    if-le p1, v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 6
    .line 7
    if-lt p1, v1, :cond_1

    .line 8
    .line 9
    :cond_0
    if-le p2, v0, :cond_2

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

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

.method public e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
