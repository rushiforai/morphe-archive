.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;
.super Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;
    }
.end annotation


# instance fields
.field public c:Lcom/tantan/library/svga/SVGAnimationView;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/ImageView;

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

.field public k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

.field public l:Ljava/lang/String;

.field public m:Z

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->i:Z

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;-><init>(Ll/m6l;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;-><init>(Ll/m6l;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->l:Ljava/lang/String;

    .line 25
    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 27
    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n:Z

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->i:Z

    .line 34
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;-><init>(Ll/m6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 35
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;-><init>(Ll/m6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->l:Ljava/lang/String;

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->i:Z

    .line 42
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;-><init>(Ll/m6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 43
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    invoke-direct {p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;-><init>(Ll/m6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 44
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->l:Ljava/lang/String;

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n:Z

    return-void
.end method

.method public static synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->f:Landroid/widget/ImageView;

    return-object p0
.end method

.method private getRefreshRate()F
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x42700000    # 60.0f

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroid/view/Display;->getRefreshRate()F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->h:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    return p0
.end method

.method private m()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_3

    .line 7
    .line 8
    instance-of v1, p0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    move-object v1, p0

    .line 13
    check-cast v1, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/16 v3, 0x8

    .line 20
    .line 21
    if-ne v2, v3, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    instance-of p0, p0, Ll/bvl;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    return v0

    .line 30
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    goto :goto_0

    .line 35
    :cond_3
    return v0
.end method

.method private o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 5
    .line 6
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 5
    .line 6
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private q()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 16
    .line 17
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 18
    .line 19
    const/high16 v2, -0x40800000    # -1.0f

    .line 20
    .line 21
    cmpl-float v1, v1, v2

    .line 22
    .line 23
    if-eqz v1, :cond_4

    .line 24
    .line 25
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    cmpl-float v1, v1, v3

    .line 29
    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->getRefreshRate()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const v4, 0x3e570a3d    # 0.21f

    .line 38
    .line 39
    .line 40
    mul-float/2addr v1, v4

    .line 41
    const/high16 v4, 0x3f800000    # 1.0f

    .line 42
    .line 43
    div-float/2addr v4, v1

    .line 44
    iput v4, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 47
    .line 48
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 49
    .line 50
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 51
    .line 52
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 53
    .line 54
    const-string v1, "fakeView"

    .line 55
    .line 56
    const-string v2, " , "

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v3, "reset \u6bcf\u6b21\u52a8\u753bdiff: "

    .line 63
    .line 64
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 68
    .line 69
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 78
    .line 79
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 88
    .line 89
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 90
    .line 91
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v1, v0}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->o()V

    .line 102
    .line 103
    .line 104
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 105
    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v3, "reset \u6bcf\u6b21\u52a8\u753bdiff done: "

    .line 111
    .line 112
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 116
    .line 117
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 118
    .line 119
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 126
    .line 127
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 128
    .line 129
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {v1, p0}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_4
    :goto_0
    return-void
.end method

.method private r()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 16
    .line 17
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 18
    .line 19
    const/high16 v2, 0x3f800000    # 1.0f

    .line 20
    .line 21
    cmpl-float v1, v1, v2

    .line 22
    .line 23
    if-eqz v1, :cond_4

    .line 24
    .line 25
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 26
    .line 27
    cmpl-float v1, v1, v2

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->getRefreshRate()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const v3, 0x3e570a3d    # 0.21f

    .line 37
    .line 38
    .line 39
    mul-float/2addr v1, v3

    .line 40
    div-float v1, v2, v1

    .line 41
    .line 42
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 45
    .line 46
    const-string v1, "fakeView"

    .line 47
    .line 48
    const-string v3, " , "

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v4, "start # \u6bcf\u6b21\u52a8\u753bdiff: "

    .line 55
    .line 56
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 60
    .line 61
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 62
    .line 63
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 70
    .line 71
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 72
    .line 73
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 80
    .line 81
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 82
    .line 83
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v1, v0}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 94
    .line 95
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 96
    .line 97
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 98
    .line 99
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->o()V

    .line 100
    .line 101
    .line 102
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v2, "start # \u6bcf\u6b21\u52a8\u753bdiff: done: "

    .line 109
    .line 110
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 114
    .line 115
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 124
    .line 125
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 134
    .line 135
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 136
    .line 137
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {v1, p0}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    cmpl-float p1, p1, v0

    .line 8
    .line 9
    if-lez p1, :cond_1

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 12
    .line 13
    if-ne p2, p1, :cond_2

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->r()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 20
    .line 21
    if-eq p2, p1, :cond_3

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 24
    .line 25
    if-ne p2, p1, :cond_2

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    :goto_0
    return-void

    .line 29
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->q()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 7
    .line 8
    if-eq p1, v0, :cond_3

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE_BACK_DONE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 16
    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->q()V

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void

    .line 23
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->q()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public doFrame(J)V
    .locals 11

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 2
    .line 3
    const/high16 p2, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz p1, :cond_3

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 11
    .line 12
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 13
    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 27
    .line 28
    iget v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 29
    .line 30
    iget v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 31
    .line 32
    iget v5, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 33
    .line 34
    mul-float/2addr v5, v4

    .line 35
    add-float/2addr v3, v5

    .line 36
    iput v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 37
    .line 38
    cmpl-float v5, v4, p2

    .line 39
    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    cmpl-float v3, v3, p2

    .line 43
    .line 44
    if-lez v3, :cond_1

    .line 45
    .line 46
    iput p2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 47
    .line 48
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 49
    .line 50
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 51
    .line 52
    :goto_0
    move v3, v1

    .line 53
    move p1, v2

    .line 54
    goto :goto_2

    .line 55
    :cond_0
    const/high16 v5, -0x40800000    # -1.0f

    .line 56
    .line 57
    cmpl-float v4, v4, v5

    .line 58
    .line 59
    if-nez v4, :cond_2

    .line 60
    .line 61
    cmpg-float v3, v3, v0

    .line 62
    .line 63
    if-gez v3, :cond_1

    .line 64
    .line 65
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 66
    .line 67
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 68
    .line 69
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    move p1, v1

    .line 73
    :goto_1
    move v3, p1

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    move p1, v1

    .line 76
    move v3, v2

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    move p1, v2

    .line 79
    goto :goto_1

    .line 80
    :goto_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 81
    .line 82
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 83
    .line 84
    const-string v6, "fakeView"

    .line 85
    .line 86
    const-string v7, " , "

    .line 87
    .line 88
    const/high16 v8, 0x40000000    # 2.0f

    .line 89
    .line 90
    if-eqz v5, :cond_9

    .line 91
    .line 92
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 93
    .line 94
    if-eqz v4, :cond_4

    .line 95
    .line 96
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 97
    .line 98
    invoke-virtual {v4, p2}, Landroid/view/View;->setAlpha(F)V

    .line 99
    .line 100
    .line 101
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 102
    .line 103
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 104
    .line 105
    .line 106
    :cond_4
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 107
    .line 108
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 109
    .line 110
    iget v9, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 111
    .line 112
    iget v10, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 113
    .line 114
    mul-float/2addr v9, v10

    .line 115
    add-float/2addr v5, v9

    .line 116
    iput v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 117
    .line 118
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 119
    .line 120
    if-eqz v4, :cond_5

    .line 121
    .line 122
    new-instance v4, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v5, "click anim begin "

    .line 125
    .line 126
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 130
    .line 131
    iget v5, v5, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 132
    .line 133
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 140
    .line 141
    iget v5, v5, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 142
    .line 143
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    invoke-static {v6, v4}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_5
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 154
    .line 155
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 156
    .line 157
    cmpl-float v9, v5, v0

    .line 158
    .line 159
    if-nez v9, :cond_6

    .line 160
    .line 161
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 162
    .line 163
    cmpg-float v5, v5, v0

    .line 164
    .line 165
    if-gtz v5, :cond_8

    .line 166
    .line 167
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 168
    .line 169
    :goto_3
    move v4, v2

    .line 170
    goto :goto_4

    .line 171
    :cond_6
    cmpl-float v9, v5, p2

    .line 172
    .line 173
    if-nez v9, :cond_7

    .line 174
    .line 175
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 176
    .line 177
    cmpl-float v5, v5, p2

    .line 178
    .line 179
    if-lez v5, :cond_8

    .line 180
    .line 181
    iput p2, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 182
    .line 183
    goto :goto_3

    .line 184
    :cond_7
    cmpl-float v5, v5, v8

    .line 185
    .line 186
    if-nez v5, :cond_8

    .line 187
    .line 188
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 189
    .line 190
    cmpl-float v5, v5, v8

    .line 191
    .line 192
    if-lez v5, :cond_8

    .line 193
    .line 194
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_8
    move v4, v1

    .line 198
    :goto_4
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 199
    .line 200
    if-eqz v5, :cond_e

    .line 201
    .line 202
    new-instance v5, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    const-string v9, "click anim end "

    .line 205
    .line 206
    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 210
    .line 211
    iget v9, v9, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 212
    .line 213
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 220
    .line 221
    iget v9, v9, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 222
    .line 223
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string v9, " \uff0c "

    .line 227
    .line 228
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 238
    .line 239
    invoke-virtual {v7}, Landroid/view/View;->getAlpha()F

    .line 240
    .line 241
    .line 242
    move-result v7

    .line 243
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    invoke-static {v6, v5}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_9
    iget v1, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 255
    .line 256
    cmpl-float v4, v1, v0

    .line 257
    .line 258
    if-eqz v4, :cond_a

    .line 259
    .line 260
    cmpl-float v4, v1, p2

    .line 261
    .line 262
    if-eqz v4, :cond_a

    .line 263
    .line 264
    cmpl-float v4, v1, v8

    .line 265
    .line 266
    if-nez v4, :cond_c

    .line 267
    .line 268
    :cond_a
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 269
    .line 270
    if-eqz v4, :cond_c

    .line 271
    .line 272
    cmpl-float v4, v1, v0

    .line 273
    .line 274
    if-eqz v4, :cond_b

    .line 275
    .line 276
    cmpl-float v1, v1, v8

    .line 277
    .line 278
    if-nez v1, :cond_c

    .line 279
    .line 280
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 281
    .line 282
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 283
    .line 284
    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 286
    .line 287
    invoke-virtual {v1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 288
    .line 289
    .line 290
    :cond_c
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 291
    .line 292
    if-eqz v1, :cond_d

    .line 293
    .line 294
    new-instance v1, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    const-string v4, "click anim finish "

    .line 297
    .line 298
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 302
    .line 303
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 304
    .line 305
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 312
    .line 313
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 314
    .line 315
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    const-string v4, " \uff0c false"

    .line 319
    .line 320
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-static {v6, v1}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    :cond_d
    move v1, v2

    .line 331
    move v4, v1

    .line 332
    :cond_e
    :goto_5
    if-nez p1, :cond_f

    .line 333
    .line 334
    if-eqz v4, :cond_10

    .line 335
    .line 336
    :cond_f
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 341
    .line 342
    .line 343
    :cond_10
    if-nez v4, :cond_11

    .line 344
    .line 345
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 346
    .line 347
    iget-boolean v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 348
    .line 349
    if-eqz v4, :cond_11

    .line 350
    .line 351
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 352
    .line 353
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 354
    .line 355
    cmpl-float p1, p1, v8

    .line 356
    .line 357
    if-nez p1, :cond_11

    .line 358
    .line 359
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 360
    .line 361
    if-eqz p1, :cond_11

    .line 362
    .line 363
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 364
    .line 365
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 366
    .line 367
    .line 368
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 369
    .line 370
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 371
    .line 372
    .line 373
    :cond_11
    if-eqz v3, :cond_12

    .line 374
    .line 375
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 376
    .line 377
    if-eqz p1, :cond_12

    .line 378
    .line 379
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 380
    .line 381
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 382
    .line 383
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 384
    .line 385
    invoke-virtual {p1, v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 386
    .line 387
    .line 388
    :cond_12
    if-eqz v1, :cond_14

    .line 389
    .line 390
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 391
    .line 392
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 393
    .line 394
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 395
    .line 396
    cmpg-float p2, p0, p2

    .line 397
    .line 398
    if-gtz p2, :cond_13

    .line 399
    .line 400
    goto :goto_6

    .line 401
    :cond_13
    sub-float p0, v8, p0

    .line 402
    .line 403
    :goto_6
    invoke-virtual {p1, p0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 404
    .line 405
    .line 406
    :cond_14
    return-void
.end method

.method public n(Ll/pf60;Ljava/lang/String;)V
    .locals 3
    .param p1    # Ll/pf60;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ljava/lang/String;

    .line 7
    .line 8
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->l:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;

    .line 38
    .line 39
    invoke-direct {v1, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const/4 p2, 0x0

    .line 47
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget-object v1, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->AFTER:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 58
    .line 59
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 60
    .line 61
    .line 62
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 63
    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 87
    .line 88
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/kec0;->a4:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 20
    .line 21
    const/high16 v3, 0x42580000    # 54.0f

    .line 22
    .line 23
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-direct {v1, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    const/16 v3, 0x11

    .line 35
    .line 36
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    sget v1, Ll/adc0;->e:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 50
    .line 51
    sget v1, Ll/adc0;->z1:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 60
    .line 61
    sget v1, Ll/adc0;->h2:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->e:Landroid/view/View;

    .line 68
    .line 69
    sget v1, Ll/adc0;->q0:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Landroid/widget/ImageView;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->f:Landroid/widget/ImageView;

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->e:Landroid/view/View;

    .line 80
    .line 81
    new-instance v1, Ll/l6l;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/l6l;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 90
    .line 91
    .line 92
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 93
    .line 94
    if-nez v0, :cond_0

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 97
    .line 98
    const/16 v1, 0x8

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 104
    .line 105
    const/high16 v1, 0x3f800000    # 1.0f

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 111
    .line 112
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 113
    .line 114
    .line 115
    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setCoverDrawable(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v2, 0x4

    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->e:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->e:Landroid/view/View;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    :cond_1
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setFlagName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPlaceHolderPic(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->f:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPressed(Z)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->setPressed(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->getRefreshRate()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const v2, 0x3f333333    # 0.7f

    .line 11
    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    const/high16 v2, 0x40000000    # 2.0f

    .line 15
    .line 16
    div-float v1, v2, v1

    .line 17
    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->e:F

    .line 19
    .line 20
    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n:Z

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 28
    .line 29
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 30
    .line 31
    iget v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 32
    .line 33
    const v3, 0x3727c5ac    # 1.0E-5f

    .line 34
    .line 35
    .line 36
    add-float/2addr v2, v3

    .line 37
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->d:F

    .line 38
    .line 39
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 40
    .line 41
    iput-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 42
    .line 43
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->p()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n:Z

    .line 48
    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    const/4 p1, 0x0

    .line 53
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n:Z

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 56
    .line 57
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->b:F

    .line 58
    .line 59
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 60
    .line 61
    iput-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->c:Z

    .line 62
    .line 63
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->p()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setShowLog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSwipeEnable(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;

    .line 38
    .line 39
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$b;->a:F

    .line 40
    .line 41
    return-void
.end method
