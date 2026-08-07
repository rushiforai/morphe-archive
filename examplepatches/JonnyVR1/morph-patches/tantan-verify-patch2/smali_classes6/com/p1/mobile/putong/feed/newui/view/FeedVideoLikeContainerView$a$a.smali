.class public Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:J

.field public c:F

.field public d:F

.field public final synthetic e:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->e:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->a:I

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->b:J

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->c:F

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->d:F

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->a:I

    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->b:J

    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->c:F

    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->d:F

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a$a;->a:I

    .line 2
    .line 3
    if-eqz p0, :cond_3

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p0, v0, :cond_0

    .line 13
    .line 14
    const-string p0, ""

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string p0, "cancel"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_1
    const-string p0, "move"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_2
    const-string p0, "up"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_3
    const-string p0, "down"

    .line 27
    .line 28
    return-object p0
.end method
