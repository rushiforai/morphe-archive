.class public Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/uam;


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:Landroid/content/Context;

.field public l:J

.field public m:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

.field public n:Z

.field public o:Landroid/view/WindowManager$LayoutParams;

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/WindowManager$LayoutParams;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/fti;

.field public r:Landroid/view/View$OnClickListener;

.field public s:Z

.field public t:Landroid/view/animation/Animation;

.field public u:Landroid/view/animation/Animation;

.field public v:Z

.field public w:Ljava/lang/Runnable;

.field public x:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->n:Z

    .line 6
    .line 7
    new-instance p1, Ll/imp0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/imp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->w:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o()V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->p()V

    return-void
.end method

.method public static getBottomMargin()I
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ynp0;->y(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    return v0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0
.end method

.method private getTopMargin()I
    .locals 0

    .line 1
    invoke-static {}, Ll/bnl0;->F0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->t(II)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->k()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->s:Z

    .line 6
    .line 7
    return-void
.end method

.method public b(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->r:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->t:Landroid/view/animation/Animation;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/r7c0;->c:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->t:Landroid/view/animation/Animation;

    .line 16
    .line 17
    const-wide/16 v1, 0x532

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Ll/r7c0;->c:I

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->u:Landroid/view/animation/Animation;

    .line 33
    .line 34
    const-wide/16 v1, 0x3e8

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->a()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->b:Landroid/view/View;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->a:Landroid/view/View;

    .line 45
    .line 46
    filled-new-array {v0, v1}, [Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-static {v1, v0}, Ll/ynp0;->i(Z[Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->a:Landroid/view/View;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->u:Landroid/view/animation/Animation;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->b:Landroid/view/View;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->t:Landroid/view/animation/Animation;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 66
    .line 67
    .line 68
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->s:Z

    .line 69
    .line 70
    return-void
.end method

.method public d(Ll/oo2;Ljava/lang/String;)V
    .locals 3

    .line 1
    instance-of v0, p1, Ll/rwn0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/rwn0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/oo2;->k0()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "context_common"

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->c:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v2, p1, v0}, Ll/izs;->k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->c:Lv/VDraweeView;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    sget p1, Ll/obc0;->J8:I

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v2, v0, p1}, Ll/izs;->k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->c:Lv/VDraweeView;

    .line 61
    .line 62
    sget v0, Ll/obc0;->J8:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->d:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public getOriginView()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    return-object p0
.end method

.method public getWindowParams()Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tmp0;->a(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public init()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->k:Landroid/content/Context;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 8
    .line 9
    new-instance v1, Ll/jmp0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/jmp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;)V

    .line 12
    .line 13
    .line 14
    const/16 v2, 0x640

    .line 15
    .line 16
    invoke-direct {v0, v1, p0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;-><init>(Ll/z20;Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->m:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->l()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->m()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->r()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final j()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    aget v3, v2, v3

    .line 11
    .line 12
    int-to-float v3, v3

    .line 13
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 14
    .line 15
    iget v5, v4, Ll/fti;->g:I

    .line 16
    .line 17
    int-to-float v5, v5

    .line 18
    sub-float/2addr v5, v3

    .line 19
    iget v4, v4, Ll/fti;->e:I

    .line 20
    .line 21
    int-to-float v4, v4

    .line 22
    sub-float/2addr v5, v4

    .line 23
    cmpg-float v3, v3, v5

    .line 24
    .line 25
    if-gez v3, :cond_0

    .line 26
    .line 27
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Left:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Right:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 31
    .line 32
    :goto_0
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView$a;->a:[I

    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    aget v3, v4, v3

    .line 39
    .line 40
    const/4 v4, 0x1

    .line 41
    if-eq v3, v4, :cond_2

    .line 42
    .line 43
    if-eq v3, v1, :cond_1

    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->m:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 47
    .line 48
    sget-object v6, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Right:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 49
    .line 50
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o:Landroid/view/WindowManager$LayoutParams;

    .line 51
    .line 52
    iget v3, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 53
    .line 54
    int-to-float v7, v3

    .line 55
    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 56
    .line 57
    int-to-float v8, v1

    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 59
    .line 60
    iget v1, v0, Ll/fti;->g:I

    .line 61
    .line 62
    iget v0, v0, Ll/fti;->e:I

    .line 63
    .line 64
    sub-int/2addr v1, v0

    .line 65
    int-to-float v9, v1

    .line 66
    aget v0, v2, v4

    .line 67
    .line 68
    int-to-float v10, v0

    .line 69
    invoke-virtual/range {v5 .. v10}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;FFFF)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    iget-object v11, v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->m:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 74
    .line 75
    sget-object v12, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Left:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o:Landroid/view/WindowManager$LayoutParams;

    .line 78
    .line 79
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 80
    .line 81
    int-to-float v13, v1

    .line 82
    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 83
    .line 84
    int-to-float v14, v0

    .line 85
    aget v0, v2, v4

    .line 86
    .line 87
    int-to-float v0, v0

    .line 88
    const/4 v15, 0x0

    .line 89
    move/from16 v16, v0

    .line 90
    .line 91
    invoke-virtual/range {v11 .. v16}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;FFFF)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->b:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->a:Landroid/view/View;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1, v0}, Ll/ynp0;->i(Z[Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->b:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->a:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    new-instance v0, Ll/fti;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fti;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 7
    .line 8
    invoke-static {}, Ll/bnl0;->y0()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/content/Context;

    .line 31
    .line 32
    :goto_0
    if-nez v1, :cond_1

    .line 33
    .line 34
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 35
    .line 36
    :cond_1
    invoke-static {v1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v3, Ll/iac0;->e:I

    .line 45
    .line 46
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 51
    .line 52
    iput v1, p0, Ll/fti;->a:I

    .line 53
    .line 54
    iput v1, p0, Ll/fti;->b:I

    .line 55
    .line 56
    iput v1, p0, Ll/fti;->e:I

    .line 57
    .line 58
    iput v1, p0, Ll/fti;->f:I

    .line 59
    .line 60
    iput v0, p0, Ll/fti;->g:I

    .line 61
    .line 62
    iput v2, p0, Ll/fti;->h:I

    .line 63
    .line 64
    sub-int/2addr v0, v1

    .line 65
    iput v0, p0, Ll/fti;->c:I

    .line 66
    .line 67
    const/high16 v0, 0x42b00000    # 88.0f

    .line 68
    .line 69
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput v0, p0, Ll/fti;->d:I

    .line 74
    .line 75
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/view/WindowManager$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o:Landroid/view/WindowManager$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->k:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o:Landroid/view/WindowManager$LayoutParams;

    .line 18
    .line 19
    const v1, 0x30388

    .line 20
    .line 21
    .line 22
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 23
    .line 24
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 25
    .line 26
    const/16 v2, 0x1a

    .line 27
    .line 28
    if-lt v1, v2, :cond_0

    .line 29
    .line 30
    const/16 v1, 0x7f6

    .line 31
    .line 32
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/16 v1, 0x7d3

    .line 36
    .line 37
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 38
    .line 39
    :goto_0
    const/4 v1, 0x1

    .line 40
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 41
    .line 42
    const v1, 0x800033

    .line 43
    .line 44
    .line 45
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 48
    .line 49
    iget v1, p0, Ll/fti;->a:I

    .line 50
    .line 51
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 52
    .line 53
    iget v1, p0, Ll/fti;->b:I

    .line 54
    .line 55
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 56
    .line 57
    iget v1, p0, Ll/fti;->c:I

    .line 58
    .line 59
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 60
    .line 61
    iget p0, p0, Ll/fti;->d:I

    .line 62
    .line 63
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 64
    .line 65
    return-void
.end method

.method public final n()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->k:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->i:F

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->g:F

    .line 14
    .line 15
    sub-float/2addr v1, v2

    .line 16
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v0, v0

    .line 21
    cmpl-float v1, v1, v0

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-gtz v1, :cond_1

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->j:F

    .line 27
    .line 28
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->h:F

    .line 29
    .line 30
    sub-float/2addr v1, p0

    .line 31
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    cmpl-float p0, p0, v0

    .line 36
    .line 37
    if-lez p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    move p0, v2

    .line 43
    :goto_1
    xor-int/2addr p0, v2

    .line 44
    return p0
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->v:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->s:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->c()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->m:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->b()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->a()V

    .line 7
    .line 8
    .line 9
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eq v0, v2, :cond_3

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->g:F

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->h:F

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->n:Z

    .line 30
    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->n()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    xor-int/2addr p1, v2

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->n:Z

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q()V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->v:Z

    .line 45
    .line 46
    if-eqz p0, :cond_8

    .line 47
    .line 48
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_2

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    throw v3

    .line 56
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->w:Ljava/lang/Runnable;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 59
    .line 60
    .line 61
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->v:Z

    .line 62
    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_4

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    throw v3

    .line 73
    :cond_5
    :goto_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->v:Z

    .line 74
    .line 75
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->n:Z

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->n()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_6

    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->r:Landroid/view/View$OnClickListener;

    .line 84
    .line 85
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->g:F

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->h:F

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->j()V

    .line 102
    .line 103
    .line 104
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->s:Z

    .line 105
    .line 106
    if-eqz p1, :cond_8

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->c()V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->k()V

    .line 113
    .line 114
    .line 115
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->n:Z

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->m:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->b()V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 123
    .line 124
    .line 125
    move-result-wide v0

    .line 126
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->l:J

    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->e:F

    .line 133
    .line 134
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->f:F

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->i:F

    .line 145
    .line 146
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->j:F

    .line 151
    .line 152
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->i:F

    .line 153
    .line 154
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->g:F

    .line 155
    .line 156
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->h:F

    .line 157
    .line 158
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->w:Ljava/lang/Runnable;

    .line 159
    .line 160
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    int-to-long v0, v0

    .line 165
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 166
    .line 167
    .line 168
    :cond_8
    :goto_2
    return v2
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 2
    .line 3
    iget v1, v0, Ll/fti;->e:I

    .line 4
    .line 5
    iget v0, v0, Ll/fti;->f:I

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->s(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q()V
    .locals 7

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->g:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->e:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    float-to-int v0, v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->h:F

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->f:F

    .line 10
    .line 11
    sub-float/2addr v1, v2

    .line 12
    float-to-int v1, v1

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->getTopMargin()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->getBottomMargin()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->x:Ll/pcj;

    .line 22
    .line 23
    invoke-interface {v4}, Ll/pcj;->call()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-nez v4, :cond_0

    .line 34
    .line 35
    sget-object v4, Ll/zrv;->e:Landroid/app/Application;

    .line 36
    .line 37
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    sget v5, Ll/iac0;->a:I

    .line 42
    .line 43
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    add-int/2addr v3, v4

    .line 48
    :cond_0
    if-ge v1, v2, :cond_1

    .line 49
    .line 50
    move v1, v2

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 53
    .line 54
    iget v4, v2, Ll/fti;->h:I

    .line 55
    .line 56
    iget v2, v2, Ll/fti;->f:I

    .line 57
    .line 58
    add-int v5, v2, v3

    .line 59
    .line 60
    sub-int v5, v4, v5

    .line 61
    .line 62
    if-le v1, v5, :cond_2

    .line 63
    .line 64
    add-int/2addr v2, v3

    .line 65
    sub-int v1, v4, v2

    .line 66
    .line 67
    :cond_2
    :goto_0
    if-ltz v0, :cond_3

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 70
    .line 71
    iget v3, v2, Ll/fti;->e:I

    .line 72
    .line 73
    add-int/2addr v3, v0

    .line 74
    iget v2, v2, Ll/fti;->g:I

    .line 75
    .line 76
    if-le v3, v2, :cond_7

    .line 77
    .line 78
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->q:Ll/fti;

    .line 79
    .line 80
    const/high16 v3, 0x3f800000    # 1.0f

    .line 81
    .line 82
    const/high16 v4, 0x3f000000    # 0.5f

    .line 83
    .line 84
    if-gez v0, :cond_4

    .line 85
    .line 86
    int-to-float v5, v0

    .line 87
    iget v2, v2, Ll/fti;->e:I

    .line 88
    .line 89
    int-to-float v2, v2

    .line 90
    div-float/2addr v5, v2

    .line 91
    add-float/2addr v5, v3

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    iget v5, v2, Ll/fti;->e:I

    .line 94
    .line 95
    add-int v6, v0, v5

    .line 96
    .line 97
    iget v2, v2, Ll/fti;->g:I

    .line 98
    .line 99
    if-le v6, v2, :cond_5

    .line 100
    .line 101
    add-int v6, v0, v5

    .line 102
    .line 103
    sub-int/2addr v6, v2

    .line 104
    int-to-float v2, v6

    .line 105
    int-to-float v5, v5

    .line 106
    div-float/2addr v2, v5

    .line 107
    sub-float v5, v3, v2

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_5
    move v5, v4

    .line 111
    :goto_1
    cmpg-float v2, v5, v4

    .line 112
    .line 113
    if-gez v2, :cond_6

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_6
    move v4, v5

    .line 117
    :goto_2
    invoke-virtual {p0, v4}, Landroid/view/View;->setAlpha(F)V

    .line 118
    .line 119
    .line 120
    :cond_7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->t(II)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    new-instance v0, Ll/kmp0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kmp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final s(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 4
    .line 5
    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->p:Ll/y20;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setOnTouchListenerNative(Ll/ym50;)V
    .locals 0
    .param p1    # Ll/ym50;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public setShowExitAreaFunc(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->x:Ll/pcj;

    .line 2
    .line 3
    return-void
.end method

.method public setUpdateWindowAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/WindowManager$LayoutParams;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->p:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final t(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->o:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 4
    .line 5
    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;->p:Ll/y20;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
