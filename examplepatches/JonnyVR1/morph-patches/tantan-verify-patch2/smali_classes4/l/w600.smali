.class public Ll/w600;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w600$c;,
        Ll/w600$d;
    }
.end annotation


# static fields
.field public static g:J = 0x44cL

.field public static h:J = 0xc8L

.field public static i:J = 0x384L

.field public static j:J = 0x12cL


# instance fields
.field public a:Landroid/animation/ValueAnimator;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/w600$d;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/x600;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w600;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/w600;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w600;->i()V

    return-void
.end method

.method public static synthetic b(Ll/w600;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w600;->j()V

    return-void
.end method

.method public static bridge synthetic c(Ll/w600;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w600;->d:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/w600;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w600;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/w600;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w600;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/w600;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w600;->f:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static h()Ll/w600;
    .locals 1

    .line 1
    invoke-static {}, Ll/w600$c;->a()Ll/w600;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final g(Landroid/content/Context;)Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w600;->e:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/w600;->k(Ll/w600$d;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/w600;->e:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/w600;->n()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/w600;->e:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroid/view/ViewGroup;

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-object p0
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/w600;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mh(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w600;->e:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/w600;->e:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/view/View;

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    new-array v0, v0, [F

    .line 21
    .line 22
    fill-array-data v0, :array_0

    .line 23
    .line 24
    .line 25
    const-string v1, "alpha"

    .line 26
    .line 27
    invoke-static {p0, v1, v0}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-wide v0, Ll/w600;->j:J

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void

    .line 41
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final k(Ll/w600$d;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/w600;->d:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/w600;->b:Ljava/lang/String;

    .line 3
    .line 4
    iput-object v0, p0, Ll/w600;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/w600;->d:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    iput-object v0, p0, Ll/w600;->e:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    iput-object v0, p0, Ll/w600;->f:Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    iget-object v1, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iput-object v0, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    return-void
.end method

.method public m(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w600;->b:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w600;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public final n()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/w600;->o()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    sget-wide v1, Ll/w600;->h:J

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    sget-wide v1, Ll/w600;->g:J

    .line 29
    .line 30
    const-wide/16 v3, 0x2

    .line 31
    .line 32
    mul-long/2addr v1, v3

    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    new-instance v1, Ll/w600$a;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/w600$a;-><init>(Ll/w600;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x7

    .line 47
    new-array v0, v0, [F

    .line 48
    .line 49
    fill-array-data v0, :array_1

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget-wide v1, Ll/w600;->i:J

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    sget-wide v5, Ll/w600;->g:J

    .line 63
    .line 64
    mul-long/2addr v5, v3

    .line 65
    sget-wide v2, Ll/w600;->h:J

    .line 66
    .line 67
    add-long/2addr v5, v2

    .line 68
    invoke-virtual {v1, v5, v6}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/w600$b;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/w600$b;-><init>(Ll/w600;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 77
    .line 78
    .line 79
    new-instance v1, Ll/u600;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/u600;-><init>(Ll/w600;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/w600;->a:Landroid/animation/ValueAnimator;

    .line 92
    .line 93
    new-instance v1, Ll/v600;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/v600;-><init>(Ll/w600;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 103
    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/xab;->i3()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :array_0
    .array-data 4
        0x0
        0x42700000    # 60.0f
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    :array_1
    .array-data 4
        0x0
        -0x3e900000    # -15.0f
        0x0
        0x41700000    # 15.0f
        0x0
        -0x3e900000    # -15.0f
        0x0
    .end array-data
.end method

.method public final o()V
    .locals 4

    .line 1
    const-string p0, "tooltips_trigger_module"

    .line 2
    .line 3
    const-string v0, "null"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "tooltips_trigger_page"

    .line 10
    .line 11
    const-string v1, "chat_page"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "tooltips_trigger_reason"

    .line 18
    .line 19
    const-string v2, "guide"

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v3, "overlay"

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    filled-new-array {p0, v0, v1, v2}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "e_tickle_popup"

    .line 38
    .line 39
    const-string v1, "p_chat_view"

    .line 40
    .line 41
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    instance-of v0, v0, Ll/jlz;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto/16 :goto_0

    .line 34
    .line 35
    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    instance-of v0, v0, Ll/tvz;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ll/tvz;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/tvz;->V2()Z

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget v1, Ll/edc0;->q:I

    .line 88
    .line 89
    invoke-virtual {p4, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/w600;->b:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_4

    .line 99
    .line 100
    iget-object v0, p0, Ll/w600;->c:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_4

    .line 107
    .line 108
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 109
    .line 110
    invoke-direct {p2, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    iput-object p2, p0, Ll/w600;->f:Ljava/lang/ref/WeakReference;

    .line 114
    .line 115
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {p0, p2}, Ll/w600;->g(Landroid/content/Context;)Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    if-eqz p0, :cond_3

    .line 124
    .line 125
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 126
    .line 127
    const/4 p4, -0x1

    .line 128
    invoke-direct {p2, p4, p4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p3, p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    .line 133
    .line 134
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 137
    .line 138
    iget-object p0, p0, Ll/xab;->S:Ll/jxd0;

    .line 139
    .line 140
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 141
    .line 142
    invoke-virtual {p0, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 148
    .line 149
    iget-object p0, p0, Ll/xab;->T:Ll/jxd0;

    .line 150
    .line 151
    invoke-virtual {p0, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 157
    .line 158
    iget-object p0, p0, Ll/xab;->U:Ll/wyd0;

    .line 159
    .line 160
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    :cond_4
    :goto_0
    return-void
.end method
