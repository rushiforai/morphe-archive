.class public Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;
    }
.end annotation


# static fields
.field public static j:J = 0x12cL


# instance fields
.field public a:Ljava/lang/Runnable;

.field public b:I

.field public c:I

.field public d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

.field public e:Z

.field public f:Z

.field public g:J

.field public h:Landroid/os/Handler;

.field public i:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->a:Ljava/lang/Runnable;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;Ll/zai;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 16
    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->f:Z

    .line 18
    .line 19
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->g:J

    .line 22
    .line 23
    new-instance p1, Landroid/os/Handler;

    .line 24
    .line 25
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->h:Landroid/os/Handler;

    .line 29
    .line 30
    new-instance p1, Ll/yai;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Ll/yai;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->i:Ljava/lang/Runnable;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->a:Ljava/lang/Runnable;

    .line 40
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;Ll/zai;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->f:Z

    const-wide/16 p1, 0x0

    .line 43
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->g:J

    .line 44
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->h:Landroid/os/Handler;

    .line 45
    new-instance p1, Ll/yai;

    invoke-direct {p1, p0}, Ll/yai;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->i:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->a:Ljava/lang/Runnable;

    .line 48
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;Ll/zai;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    const/4 p1, 0x0

    .line 49
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 50
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->f:Z

    const-wide/16 p1, 0x0

    .line 51
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->g:J

    .line 52
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->h:Landroid/os/Handler;

    .line 53
    new-instance p1, Ll/yai;

    invoke-direct {p1, p0}, Ll/yai;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->i:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 54
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->a:Ljava/lang/Runnable;

    .line 56
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;Ll/zai;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    const/4 p1, 0x0

    .line 57
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 58
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->f:Z

    const-wide/16 p1, 0x0

    .line 59
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->g:J

    .line 60
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->h:Landroid/os/Handler;

    .line 61
    new-instance p1, Ll/yai;

    invoke-direct {p1, p0}, Ll/yai;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->i:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->c()V

    return-void
.end method

.method public static bridge synthetic b()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->j:J

    return-wide v0
.end method


# virtual methods
.method public final synthetic c()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->f:Z

    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->b:I

    .line 16
    .line 17
    int-to-float v6, v0

    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->c:I

    .line 19
    .line 20
    int-to-float v7, v0

    .line 21
    const/4 v8, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->b:I

    .line 39
    .line 40
    int-to-float v6, v0

    .line 41
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->c:I

    .line 42
    .line 43
    int-to-float v7, v0

    .line 44
    const/4 v5, 0x1

    .line 45
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public d()Z
    .locals 6

    .line 1
    invoke-static {}, Ll/a2j0;->h()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->g:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    int-to-long v4, v4

    .line 14
    cmp-long v2, v2, v4

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    if-gez v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    :cond_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->g:J

    .line 24
    .line 25
    return v3
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView$a;->a(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    float-to-int v0, v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->b:I

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    float-to-int v0, v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->c:I

    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->f:Z

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->f:Z

    .line 30
    .line 31
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->d()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->h:Landroid/os/Handler;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->i:Ljava/lang/Runnable;

    .line 45
    .line 46
    const-wide/16 v2, 0x12c

    .line 47
    .line 48
    invoke-virtual {p1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 49
    .line 50
    .line 51
    return v1

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->a:Ljava/lang/Runnable;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->a:Ljava/lang/Runnable;

    .line 66
    .line 67
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 68
    .line 69
    .line 70
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->e:Z

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    return v1

    .line 75
    :cond_3
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->h:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public setOnClick(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method
