.class public Ll/tum0;
.super Ll/o5o0;
.source "SourceFile"


# instance fields
.field public final d:Ll/f8o0;

.field public e:Ll/i6t;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/w3o0;Ll/dum;Ll/ram;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/o5o0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/w3o0;Ll/dum;)V

    .line 2
    .line 3
    .line 4
    check-cast p4, Ll/f8o0;

    .line 5
    .line 6
    iput-object p4, p0, Ll/tum0;->d:Ll/f8o0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/o5o0;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tum0;->d:Ll/f8o0;

    .line 5
    .line 6
    iget-object v0, v0, Ll/f8o0;->a:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    sget v1, Ll/bnl0;->e:I

    .line 14
    .line 15
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 20
    .line 21
    iget-object v1, p0, Ll/tum0;->d:Ll/f8o0;

    .line 22
    .line 23
    iget-object v2, v1, Ll/f8o0;->a:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    iget-object v1, v1, Ll/f8o0;->b:Ll/sam;

    .line 26
    .line 27
    iget-object v3, p0, Ll/o5o0;->c:Ll/dum;

    .line 28
    .line 29
    iget-object v3, v3, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-interface {v1, v3}, Ll/sam;->g(Landroid/content/Context;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v2, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/tum0;->d:Ll/f8o0;

    .line 39
    .line 40
    iget-object v0, v0, Ll/f8o0;->a:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/s2n0;

    .line 47
    .line 48
    iget-object v1, p0, Ll/o5o0;->c:Ll/dum;

    .line 49
    .line 50
    iget-object v2, p0, Ll/tum0;->d:Ll/f8o0;

    .line 51
    .line 52
    iget-object v2, v2, Ll/f8o0;->b:Ll/sam;

    .line 53
    .line 54
    invoke-direct {v0, v1, v2}, Ll/s2n0;-><init>(Ll/dum;Ll/sam;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/o5o0;->d(Ll/l6t;)Ll/l6t;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/i6t;

    .line 62
    .line 63
    iput-object v0, p0, Ll/tum0;->e:Ll/i6t;

    .line 64
    .line 65
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/o5o0;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tum0;->e:Ll/i6t;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/o5o0;->g(Ll/l6t;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/tum0;->e:Ll/i6t;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/tum0;->d:Ll/f8o0;

    .line 15
    .line 16
    iget-object v0, v0, Ll/f8o0;->a:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/tum0;->d:Ll/f8o0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/f8o0;->a:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
