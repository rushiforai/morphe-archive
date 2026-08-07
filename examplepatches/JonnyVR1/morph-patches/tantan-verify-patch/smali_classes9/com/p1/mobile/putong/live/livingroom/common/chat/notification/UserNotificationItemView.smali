.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Z

.field public j:Ll/ft5;

.field public k:Landroid/animation/Animator;

.field public l:Landroid/animation/Animator;

.field public m:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/p9t;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/p9t;

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m:Ll/y20;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m:Ll/y20;

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m:Ll/y20;

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    return-void
.end method

.method private C(Ll/y20;)V
    .locals 6
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/p9t;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ft5;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j:Ll/ft5;

    .line 7
    .line 8
    const-wide/16 v1, 0x1

    .line 9
    .line 10
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    invoke-static {v4, v5, v1, v2, v3}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/p9t;->f()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    long-to-int v2, v2

    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ll/agk0;

    .line 40
    .line 41
    invoke-direct {v2, p0, p1}, Ll/agk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j:Ll/ft5;

    .line 56
    .line 57
    invoke-static {}, Ll/tz40;->a()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ll/bgk0;

    .line 62
    .line 63
    invoke-direct {v2, p0, p1}, Ll/bgk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/y20;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private D(Ll/y20;)V
    .locals 2
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/p9t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l:Landroid/animation/Animator;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    new-array p1, p1, [F

    .line 9
    .line 10
    fill-array-data p1, :array_0

    .line 11
    .line 12
    .line 13
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l:Landroid/animation/Animator;

    .line 20
    .line 21
    const-wide/16 v0, 0xc8

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l:Landroid/animation/Animator;

    .line 27
    .line 28
    new-instance v0, Ll/wfk0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/wfk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l:Landroid/animation/Animator;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    nop

    .line 43
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->r(Ll/x20;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->s(Ll/y20;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->q()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/y20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o(Ll/y20;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/p9t;Ljava/lang/String;Ll/y20;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n(Ll/p9t;Ljava/lang/String;Ll/y20;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/y20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->p(Ll/y20;Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->B(Ljava/lang/String;I)V

    return-void
.end method

.method private synthetic o(Ll/y20;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/p9t;->f()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-gez v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/p9t;->k()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/p9t;->f()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 34
    .line 35
    .line 36
    move-result-wide p1

    .line 37
    sub-long/2addr v0, p1

    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/p9t;->b()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string p2, "%@"

    .line 45
    .line 46
    const-string v2, "%s"

    .line 47
    .line 48
    invoke-virtual {p1, p2, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, ""

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void

    .line 83
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->D(Ll/y20;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private synthetic r(Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic s(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->C(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method


# virtual methods
.method public final A(Landroid/view/View;Ll/p9t;Ll/y20;ZLjava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/p9t;",
            "Ll/y20<",
            "Ll/p9t;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zfk0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p2

    .line 5
    move-object v4, p3

    .line 6
    move v5, p4

    .line 7
    move-object v3, p5

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/zfk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/p9t;Ljava/lang/String;Ll/y20;Z)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final B(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/tz40;->b()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final E(Ll/x20;Ll/y20;Z)V
    .locals 2
    .param p2    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            "Ll/y20<",
            "Ll/p9t;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k:Landroid/animation/Animator;

    .line 5
    .line 6
    if-nez p3, :cond_1

    .line 7
    .line 8
    const/4 p3, 0x2

    .line 9
    new-array p3, p3, [F

    .line 10
    .line 11
    fill-array-data p3, :array_0

    .line 12
    .line 13
    .line 14
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 15
    .line 16
    invoke-static {p0, v0, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k:Landroid/animation/Animator;

    .line 21
    .line 22
    const-wide/16 v0, 0xc8

    .line 23
    .line 24
    invoke-virtual {p3, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k:Landroid/animation/Animator;

    .line 28
    .line 29
    new-instance v0, Ll/xfk0;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/xfk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ll/yfk0;

    .line 35
    .line 36
    invoke-direct {p1, p0, p2}, Ll/yfk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p3, v0, p1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k:Landroid/animation/Animator;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    nop

    .line 49
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public M()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cgk0;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {}, Ll/tz40;->b()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Integer;

    .line 10
    .line 11
    return-object p0
.end method

.method public k(Ll/y20;)V
    .locals 1
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/p9t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l:Landroid/animation/Animator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j:Ll/ft5;

    .line 20
    .line 21
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->D(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic n(Ll/p9t;Ljava/lang/String;Ll/y20;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/tz40;->c(Ll/p9t;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Ll/i35;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Ll/p9t;->j()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/p9t;->d()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getSchema()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_2

    .line 29
    .line 30
    :cond_1
    invoke-virtual {p1}, Ll/p9t;->g()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string p5, "follow"

    .line 35
    .line 36
    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_3

    .line 41
    .line 42
    :cond_2
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j:Ll/ft5;

    .line 46
    .line 47
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 48
    .line 49
    .line 50
    if-eqz p4, :cond_3

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k(Ll/y20;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j:Ll/ft5;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Ll/y20;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/p9t;->g()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p2, v0}, Ll/tz40;->g(Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/p9t;->g()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p2, v0}, Ll/tz40;->d(Ljava/lang/String;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k(Ll/y20;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final synthetic q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m:Ll/y20;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j(Ljava/lang/String;)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eq v1, v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    new-array v1, v1, [Landroid/view/View;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    aput-object p2, v1, v2

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 33
    .line 34
    .line 35
    const-string p0, "context_single_room"

    .line 36
    .line 37
    invoke-static {p0, p2, p1, v0}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j:Ll/ft5;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->v(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->v(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final w(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Ll/p9t;Ll/y20;ZLjava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;",
            "Ll/p9t;",
            "Ll/y20<",
            "Ll/p9t;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getButton()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v7

    .line 5
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getIcon()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->f:Lv/VDraweeView;

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    move-object v3, p2

    .line 23
    move-object v4, p3

    .line 24
    move v5, p4

    .line 25
    move-object v6, p5

    .line 26
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->x(Landroid/view/View;Ljava/lang/String;Ll/p9t;Ll/y20;ZLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->h:Lv/VText;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    move-object v0, p0

    .line 34
    move-object v3, p2

    .line 35
    move-object v4, p3

    .line 36
    move v5, p4

    .line 37
    move-object v6, p5

    .line 38
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->x(Landroid/view/View;Ljava/lang/String;Ll/p9t;Ll/y20;ZLjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->h:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getContent()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getBgcolor()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getStartColor()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getBgcolor()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getEndColor()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    filled-new-array {v1, v2}, [I

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 79
    .line 80
    sget v3, Ll/qa00;->h:I

    .line 81
    .line 82
    int-to-float v3, v3

    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-static {v1, v2, v3, v4}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getBgcolor()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getAlpha()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const/high16 v3, 0x437f0000    # 255.0f

    .line 101
    .line 102
    mul-float/2addr v2, v3

    .line 103
    float-to-int v2, v2

    .line 104
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->h:Lv/VText;

    .line 108
    .line 109
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getTextColor()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-nez v1, :cond_1

    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->h:Lv/VText;

    .line 123
    .line 124
    invoke-virtual {v7}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getTextColor()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 133
    .line 134
    .line 135
    :cond_1
    return-void
.end method

.method public final x(Landroid/view/View;Ljava/lang/String;Ll/p9t;Ll/y20;ZLjava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            "Ll/p9t;",
            "Ll/y20<",
            "Ll/p9t;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    .line 3
    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-object v1, p0

    .line 9
    move-object v3, p3

    .line 10
    move-object v4, p4

    .line 11
    move v5, p5

    .line 12
    move-object v6, p6

    .line 13
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->A(Landroid/view/View;Ll/p9t;Ll/y20;ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    instance-of p0, p1, Lv/VDraweeView;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    check-cast p1, Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {v1, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public y(Ll/p9t;Ll/y20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p9t;",
            "Ll/y20<",
            "Ll/p9t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v5, 0x0

    .line 2
    const-string v6, ""

    .line 3
    .line 4
    const/4 v3, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->z(Ll/p9t;Ll/y20;Ll/x20;Ll/y20;ZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public z(Ll/p9t;Ll/y20;Ll/x20;Ll/y20;ZLjava/lang/String;)V
    .locals 9
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p9t;",
            "Ll/y20<",
            "Ll/p9t;",
            ">;",
            "Ll/x20;",
            "Ll/y20<",
            "Ll/p9t;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_6

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->n:Ll/p9t;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/p9t;->l()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->i:Z

    .line 12
    .line 13
    xor-int/lit8 v1, p5, 0x1

    .line 14
    .line 15
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->j:Ll/ft5;

    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->e:Lv/VImage;

    .line 24
    .line 25
    const/4 v7, 0x0

    .line 26
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->f:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->h:Lv/VText;

    .line 35
    .line 36
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->g:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iput-boolean v7, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/p9t;->d()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-virtual {p1}, Ll/p9t;->d()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;->gotoLink:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;

    .line 59
    .line 60
    if-ne v6, v2, :cond_1

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getSchema()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_1

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->e:Lv/VImage;

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    move-object v0, p0

    .line 76
    move-object v3, p1

    .line 77
    move-object v4, p2

    .line 78
    move v5, p5

    .line 79
    move-object v6, p6

    .line 80
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->x(Landroid/view/View;Ljava/lang/String;Ll/p9t;Ll/y20;ZLjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;->staticButton:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;

    .line 85
    .line 86
    if-ne v6, v0, :cond_2

    .line 87
    .line 88
    move-object v0, p0

    .line 89
    move-object v2, p1

    .line 90
    move-object v3, p2

    .line 91
    move v4, p5

    .line 92
    move-object v5, p6

    .line 93
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->w(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Ll/p9t;Ll/y20;ZLjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;->dynamicButton:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;

    .line 98
    .line 99
    if-ne v6, v2, :cond_3

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getButton()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getUrl()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->g:Lv/VDraweeView;

    .line 110
    .line 111
    move-object v0, p0

    .line 112
    move-object v3, p1

    .line 113
    move-object v4, p2

    .line 114
    move v5, p5

    .line 115
    move-object v6, p6

    .line 116
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->x(Landroid/view/View;Ljava/lang/String;Ll/p9t;Ll/y20;ZLjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_3
    :goto_0
    invoke-virtual {p1}, Ll/p9t;->a()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p1}, Ll/p9t;->h()Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_4

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getStartColor()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-nez v2, :cond_4

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getEndColor()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-nez v2, :cond_4

    .line 148
    .line 149
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getStartColor()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getEndColor()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    filled-new-array {v2, v3}, [I

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 170
    .line 171
    sget v4, Ll/qa00;->i:I

    .line 172
    .line 173
    int-to-float v4, v4

    .line 174
    invoke-static {v2, v3, v4, v7}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getAlpha()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    const/high16 v3, 0x437f0000    # 255.0f

    .line 187
    .line 188
    mul-float/2addr v1, v3

    .line 189
    float-to-int v1, v1

    .line 190
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 191
    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->a:Landroid/widget/LinearLayout;

    .line 194
    .line 195
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 196
    .line 197
    .line 198
    :cond_4
    invoke-virtual {p1}, Ll/p9t;->i()Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    const/4 v2, 0x1

    .line 203
    if-eqz v1, :cond_5

    .line 204
    .line 205
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    .line 206
    .line 207
    if-eqz v3, :cond_5

    .line 208
    .line 209
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->c:Lv/VDraweeView;

    .line 210
    .line 211
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->b:Lv/VDraweeView;

    .line 215
    .line 216
    invoke-static {v4, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    goto :goto_1

    .line 220
    :cond_5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->b:Lv/VDraweeView;

    .line 221
    .line 222
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 223
    .line 224
    .line 225
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->c:Lv/VDraweeView;

    .line 226
    .line 227
    invoke-static {v4, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 228
    .line 229
    .line 230
    :goto_1
    const/high16 v4, 0x41400000    # 12.0f

    .line 231
    .line 232
    if-eqz v1, :cond_6

    .line 233
    .line 234
    sget v6, Ll/qa00;->g:I

    .line 235
    .line 236
    goto :goto_2

    .line 237
    :cond_6
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    :goto_2
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 242
    .line 243
    invoke-static {v8, v6}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 244
    .line 245
    .line 246
    iget-boolean v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    .line 247
    .line 248
    if-eqz v6, :cond_7

    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_7
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 252
    .line 253
    .line 254
    move-result v7

    .line 255
    :goto_3
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 256
    .line 257
    invoke-static {v4, v7}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {p1}, Ll/p9t;->i()Z

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    if-eqz v4, :cond_9

    .line 265
    .line 266
    invoke-virtual {p1}, Ll/p9t;->c()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    sget-object v6, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;->iconUrl:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;

    .line 275
    .line 276
    const-string v7, "context_livingAct"

    .line 277
    .line 278
    if-ne v4, v6, :cond_8

    .line 279
    .line 280
    invoke-virtual {p1}, Ll/p9t;->c()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getUrl()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    sget v6, Ll/qa00;->s:I

    .line 289
    .line 290
    invoke-static {v7, v3, v4, v6}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 291
    .line 292
    .line 293
    goto :goto_4

    .line 294
    :cond_8
    invoke-virtual {p1}, Ll/p9t;->c()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;

    .line 299
    .line 300
    .line 301
    move-result-object v4

    .line 302
    sget-object v6, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;->userSelf:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;

    .line 303
    .line 304
    if-ne v4, v6, :cond_9

    .line 305
    .line 306
    sget-object v4, Ll/htd0;->b:Ll/htd0;

    .line 307
    .line 308
    invoke-static {v4}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v4

    .line 312
    check-cast v4, Ll/jfv;

    .line 313
    .line 314
    sget-object v6, Ll/zrv;->a:Ll/wrv;

    .line 315
    .line 316
    invoke-virtual {v6}, Ll/wrv;->D0()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v6

    .line 320
    invoke-virtual {v4, v6}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 321
    .line 322
    .line 323
    move-result-object v4

    .line 324
    invoke-static {v4}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    iget-object v4, v4, Ll/nsv;->a:Ljava/lang/Object;

    .line 329
    .line 330
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 331
    .line 332
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 333
    .line 334
    .line 335
    move-result-object v4

    .line 336
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 337
    .line 338
    invoke-static {v7, v3, v4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    :cond_9
    :goto_4
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 342
    .line 343
    invoke-virtual {p1}, Ll/p9t;->b()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v4

    .line 347
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    .line 349
    .line 350
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->o:Z

    .line 351
    .line 352
    if-eqz v3, :cond_a

    .line 353
    .line 354
    if-eqz v1, :cond_a

    .line 355
    .line 356
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 357
    .line 358
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 359
    .line 360
    .line 361
    goto :goto_5

    .line 362
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 363
    .line 364
    const/4 v2, 0x2

    .line 365
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 366
    .line 367
    .line 368
    :goto_5
    invoke-virtual {p0, p3, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->E(Ll/x20;Ll/y20;Z)V

    .line 369
    .line 370
    .line 371
    invoke-virtual {p1}, Ll/p9t;->k()Z

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    if-eqz v1, :cond_b

    .line 376
    .line 377
    invoke-virtual {p1}, Ll/p9t;->b()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    const-string v2, "%@"

    .line 382
    .line 383
    const-string v3, "%s"

    .line 384
    .line 385
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    new-instance v2, Ljava/lang/StringBuilder;

    .line 390
    .line 391
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 392
    .line 393
    .line 394
    invoke-virtual {p1}, Ll/p9t;->f()J

    .line 395
    .line 396
    .line 397
    move-result-wide v3

    .line 398
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    const-string v3, ""

    .line 402
    .line 403
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    .line 405
    .line 406
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object v2

    .line 410
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->d:Lv/VText;

    .line 419
    .line 420
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    .line 422
    .line 423
    :cond_b
    invoke-virtual {p1}, Ll/p9t;->g()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    const-string v1, "officialShowAudienceTrack"

    .line 428
    .line 429
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    if-eqz v0, :cond_c

    .line 434
    .line 435
    const-string v0, "live_category"

    .line 436
    .line 437
    const-string v1, "to_previous_room"

    .line 438
    .line 439
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    filled-new-array {v0}, [Ll/pf60;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    const-string v1, "e_live_bottom_popup"

    .line 448
    .line 449
    const-string v2, "p_user_live_room"

    .line 450
    .line 451
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 452
    .line 453
    .line 454
    :cond_c
    :goto_6
    return-void
.end method
