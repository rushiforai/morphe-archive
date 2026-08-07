.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    }
.end annotation


# instance fields
.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

.field public e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

.field public f:F

.field public g:F

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "other"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->h:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->i:Z

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->b2()V

    return-void
.end method


# virtual methods
.method public Z1(ZLandroid/widget/TextView;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0, p2, p1}, Ll/jfh;->a(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Z)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jka;->Pb()Ll/jfh;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0, p2, p1}, Ll/jfh;->d(Landroid/widget/TextView;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final a2(FF)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    cmpl-float p0, p0, p1

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public final synthetic b2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->j1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->o0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X1()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-static {}, Ll/cmg;->x0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    new-instance v1, Ll/ga40;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/ga40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "p_fake_nearby_moment_popup"

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {v0, p0, v2, v1}, Ll/zzg;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e2()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->e0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    if-eq v2, v3, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->f:F

    .line 28
    .line 29
    sub-float/2addr v0, v2

    .line 30
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->g:F

    .line 31
    .line 32
    sub-float/2addr v1, v2

    .line 33
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->h:Z

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/high16 v3, 0x42480000    # 50.0f

    .line 42
    .line 43
    cmpl-float v2, v2, v3

    .line 44
    .line 45
    if-lez v2, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->a2(FF)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->f:F

    .line 56
    .line 57
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->g:F

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->v0(FF)V

    .line 60
    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->h:Z

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->f:F

    .line 67
    .line 68
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->g:F

    .line 69
    .line 70
    const/4 v0, 0x1

    .line 71
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->h:Z

    .line 72
    .line 73
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0
.end method

.method public final e2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/lpg;->j0()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->t1()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->finish()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->w0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j0()V

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g2()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cng;->g()Ll/cng;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/cng;->f()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;-><init>(Ll/ner;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->P0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 25
    .line 26
    .line 27
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/cn40;->a:I

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    if-ne p2, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 12
    .line 13
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->R1(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/16 v0, 0x2724

    .line 18
    .line 19
    if-ne p1, v0, :cond_1

    .line 20
    .line 21
    if-ne p2, v1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 24
    .line 25
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->b1(Landroid/os/Bundle;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R1()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/16 v0, 0x2738

    .line 39
    .line 40
    if-ne p1, v0, :cond_2

    .line 41
    .line 42
    if-ne p2, v1, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 45
    .line 46
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const-string p3, "userState"

    .line 51
    .line 52
    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->V1(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Y1()V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->s1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cng;->g()Ll/cng;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/cng;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->J1(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->v1()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "DIRECT_TO_TAKE_VIDEO_PAGE"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->i:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 29
    .line 30
    new-instance v1, Ll/fa40;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/fa40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v2, 0x1f4

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->i:Z

    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "extra_images"

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onStopLifecycle()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->w0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->L:Z

    .line 10
    .line 11
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onStopLifecycle()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_moment_post"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    new-instance v0, Landroid/content/Intent;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v0, v1}, Ll/l51;->p(Landroid/content/Intent;Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const-string v1, "after_signin"

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/orb0;->J(Landroid/content/Context;Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->finish()V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "extra_from"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 86
    .line 87
    :cond_2
    const-string v0, "from_mine_tab_album"

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 98
    .line 99
    iget-object v0, v0, Ll/jka;->w1:Lrx/subjects/b;

    .line 100
    .line 101
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 107
    .line 108
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->i1(Landroid/os/Bundle;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 112
    .line 113
    const-string v1, "share"

    .line 114
    .line 115
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    const-string v2, ""

    .line 122
    .line 123
    if-eqz v1, :cond_5

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 128
    .line 129
    if-nez v1, :cond_4

    .line 130
    .line 131
    move-object v1, v2

    .line 132
    goto :goto_0

    .line 133
    :cond_4
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 137
    .line 138
    :goto_0
    const-string v3, "posted_source"

    .line 139
    .line 140
    invoke-static {v3, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    const-string v3, "is_masked"

    .line 145
    .line 146
    const/4 v4, 0x0

    .line 147
    invoke-static {v3, v4}, Ll/tfj0$a;->f(Ljava/lang/String;I)Ll/tfj0$a;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 152
    .line 153
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->j:Ljava/lang/String;

    .line 154
    .line 155
    if-nez v5, :cond_6

    .line 156
    .line 157
    move-object v5, v2

    .line 158
    :cond_6
    const-string v6, "moment_post_guide_type"

    .line 159
    .line 160
    invoke-static {v6, v5}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    const-string v7, "false"

    .line 169
    .line 170
    if-nez v6, :cond_7

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    const-string v8, "extra_from_photo_to_video"

    .line 178
    .line 179
    invoke-virtual {v6, v8, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    if-eqz v6, :cond_8

    .line 184
    .line 185
    const-string v7, "true"

    .line 186
    .line 187
    :cond_8
    :goto_1
    const-string v6, "is_from_photo_to_video"

    .line 188
    .line 189
    invoke-static {v6, v7}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 190
    .line 191
    .line 192
    move-result-object v6

    .line 193
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 194
    .line 195
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 196
    .line 197
    if-nez v7, :cond_9

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_9
    invoke-virtual {v7}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->getTrackInfomation()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    :goto_2
    const-string v7, "information"

    .line 205
    .line 206
    invoke-static {v7, v2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    filled-new-array {v1, v3, v5, v6, v2}, [Ll/tfj0$a;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-static {v1}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 225
    .line 226
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A0()V

    .line 227
    .line 228
    .line 229
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method
