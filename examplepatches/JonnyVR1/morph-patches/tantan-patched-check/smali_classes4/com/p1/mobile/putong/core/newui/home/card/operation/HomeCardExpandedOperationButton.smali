.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;
.super Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;
    }
.end annotation


# instance fields
.field public c:Lcom/tantan/library/svga/SVGAnimationView;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/ImageView;

.field public g:Z

.field public h:Z

.field public i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

.field public j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

.field public k:Ljava/lang/String;

.field public l:Z


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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->h:Z

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;-><init>(Ll/k6l;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;-><init>(Ll/k6l;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->k:Ljava/lang/String;

    .line 25
    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->h:Z

    .line 32
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;-><init>(Ll/k6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 33
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;-><init>(Ll/k6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->k:Ljava/lang/String;

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->h:Z

    .line 39
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;-><init>(Ll/k6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 40
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    invoke-direct {p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;-><init>(Ll/k6l;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 41
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->k:Ljava/lang/String;

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

    return-void
.end method

.method public static synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->f:Landroid/widget/ImageView;

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

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method


# virtual methods
.method public a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->p()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->o()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->o()V

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void

    .line 23
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->o()V

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
    .locals 10

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 11
    .line 12
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 13
    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 27
    .line 28
    iget v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 29
    .line 30
    iget v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 31
    .line 32
    iget v5, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

    .line 33
    .line 34
    mul-float/2addr v5, v4

    .line 35
    add-float/2addr v3, v5

    .line 36
    iput v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

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
    iput p2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 47
    .line 48
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 49
    .line 50
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

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
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 66
    .line 67
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 68
    .line 69
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 81
    .line 82
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 83
    .line 84
    const-string v6, "fakeView"

    .line 85
    .line 86
    const-string v7, " , "

    .line 87
    .line 88
    if-eqz v5, :cond_c

    .line 89
    .line 90
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 91
    .line 92
    if-eqz v4, :cond_4

    .line 93
    .line 94
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 95
    .line 96
    invoke-virtual {v4, p2}, Landroid/view/View;->setAlpha(F)V

    .line 97
    .line 98
    .line 99
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 100
    .line 101
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 102
    .line 103
    .line 104
    :cond_4
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 105
    .line 106
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 107
    .line 108
    iget v8, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 109
    .line 110
    iget v9, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

    .line 111
    .line 112
    mul-float/2addr v8, v9

    .line 113
    add-float/2addr v5, v8

    .line 114
    iput v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 115
    .line 116
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

    .line 117
    .line 118
    if-eqz v4, :cond_5

    .line 119
    .line 120
    new-instance v4, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v5, "click anim begin "

    .line 123
    .line 124
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 128
    .line 129
    iget v5, v5, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 130
    .line 131
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 138
    .line 139
    iget v5, v5, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 140
    .line 141
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-static {v6, v4}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_5
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 152
    .line 153
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 154
    .line 155
    cmpl-float v8, v5, v0

    .line 156
    .line 157
    if-nez v8, :cond_6

    .line 158
    .line 159
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 160
    .line 161
    cmpg-float v5, v5, v0

    .line 162
    .line 163
    if-gtz v5, :cond_9

    .line 164
    .line 165
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 166
    .line 167
    :goto_3
    move v5, v2

    .line 168
    goto :goto_4

    .line 169
    :cond_6
    const/high16 v8, 0x3f000000    # 0.5f

    .line 170
    .line 171
    cmpl-float v9, v5, v8

    .line 172
    .line 173
    if-nez v9, :cond_8

    .line 174
    .line 175
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 176
    .line 177
    cmpl-float v9, v5, v0

    .line 178
    .line 179
    if-lez v9, :cond_7

    .line 180
    .line 181
    iget v9, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 182
    .line 183
    cmpl-float v9, v9, v8

    .line 184
    .line 185
    if-lez v9, :cond_7

    .line 186
    .line 187
    iput v8, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_7
    cmpg-float v5, v5, v0

    .line 191
    .line 192
    if-gez v5, :cond_9

    .line 193
    .line 194
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 195
    .line 196
    cmpg-float v5, v5, v8

    .line 197
    .line 198
    if-gez v5, :cond_9

    .line 199
    .line 200
    iput v8, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_8
    cmpl-float v5, v5, p2

    .line 204
    .line 205
    if-nez v5, :cond_9

    .line 206
    .line 207
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 208
    .line 209
    cmpl-float v5, v5, p2

    .line 210
    .line 211
    if-lez v5, :cond_9

    .line 212
    .line 213
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_9
    move v5, v1

    .line 217
    :goto_4
    iget v8, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 218
    .line 219
    cmpg-float v9, v8, v0

    .line 220
    .line 221
    if-ltz v9, :cond_a

    .line 222
    .line 223
    cmpl-float v8, v8, p2

    .line 224
    .line 225
    if-lez v8, :cond_b

    .line 226
    .line 227
    :cond_a
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 228
    .line 229
    move v5, v2

    .line 230
    :cond_b
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

    .line 231
    .line 232
    if-eqz v4, :cond_10

    .line 233
    .line 234
    new-instance v4, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    const-string v8, "click anim end "

    .line 237
    .line 238
    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 242
    .line 243
    iget v8, v8, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 244
    .line 245
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 252
    .line 253
    iget v8, v8, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 254
    .line 255
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    const-string v8, " \uff0c "

    .line 259
    .line 260
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 270
    .line 271
    invoke-virtual {v7}, Landroid/view/View;->getAlpha()F

    .line 272
    .line 273
    .line 274
    move-result v7

    .line 275
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v4

    .line 282
    invoke-static {v6, v4}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    goto :goto_5

    .line 286
    :cond_c
    iget v1, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 287
    .line 288
    cmpl-float v4, v1, v0

    .line 289
    .line 290
    if-eqz v4, :cond_d

    .line 291
    .line 292
    cmpl-float v1, v1, p2

    .line 293
    .line 294
    if-nez v1, :cond_e

    .line 295
    .line 296
    :cond_d
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 297
    .line 298
    if-eqz v1, :cond_e

    .line 299
    .line 300
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 301
    .line 302
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 303
    .line 304
    .line 305
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 306
    .line 307
    invoke-virtual {v1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 308
    .line 309
    .line 310
    :cond_e
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

    .line 311
    .line 312
    if-eqz v1, :cond_f

    .line 313
    .line 314
    new-instance v1, Ljava/lang/StringBuilder;

    .line 315
    .line 316
    const-string v4, "click anim finish "

    .line 317
    .line 318
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 322
    .line 323
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 324
    .line 325
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 332
    .line 333
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 334
    .line 335
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    const-string v4, " \uff0c false"

    .line 339
    .line 340
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-static {v6, v1}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    :cond_f
    move v1, v2

    .line 351
    move v5, v1

    .line 352
    :cond_10
    :goto_5
    if-nez p1, :cond_11

    .line 353
    .line 354
    if-eqz v5, :cond_12

    .line 355
    .line 356
    :cond_11
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 357
    .line 358
    .line 359
    move-result-object p1

    .line 360
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 361
    .line 362
    .line 363
    :cond_12
    if-nez v5, :cond_15

    .line 364
    .line 365
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 366
    .line 367
    iget-boolean v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 368
    .line 369
    if-eqz v4, :cond_15

    .line 370
    .line 371
    iget v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 372
    .line 373
    cmpl-float v4, v4, p2

    .line 374
    .line 375
    if-nez v4, :cond_13

    .line 376
    .line 377
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 378
    .line 379
    :cond_13
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 380
    .line 381
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 382
    .line 383
    cmpl-float v4, p1, v0

    .line 384
    .line 385
    if-eqz v4, :cond_14

    .line 386
    .line 387
    cmpl-float p1, p1, p2

    .line 388
    .line 389
    if-nez p1, :cond_15

    .line 390
    .line 391
    :cond_14
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 392
    .line 393
    if-eqz p1, :cond_15

    .line 394
    .line 395
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 396
    .line 397
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 398
    .line 399
    .line 400
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 401
    .line 402
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 403
    .line 404
    .line 405
    :cond_15
    if-eqz v3, :cond_16

    .line 406
    .line 407
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 408
    .line 409
    if-eqz p1, :cond_16

    .line 410
    .line 411
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 412
    .line 413
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 414
    .line 415
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 416
    .line 417
    invoke-virtual {p1, v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 418
    .line 419
    .line 420
    :cond_16
    if-eqz v1, :cond_17

    .line 421
    .line 422
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 423
    .line 424
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 425
    .line 426
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 427
    .line 428
    rem-float/2addr p0, p2

    .line 429
    invoke-virtual {p1, p0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 430
    .line 431
    .line 432
    :cond_17
    return-void
.end method

.method public final k()Z
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

.method public l(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->k:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$a;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$b;

    .line 61
    .line 62
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

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

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

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

.method public final o()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->k()Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 16
    .line 17
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

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
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->getRefreshRate()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const v4, 0x3e408312    # 0.188f

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
    iput v4, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 47
    .line 48
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 49
    .line 50
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 51
    .line 52
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 68
    .line 69
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 78
    .line 79
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 88
    .line 89
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->m()V

    .line 102
    .line 103
    .line 104
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 116
    .line 117
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 126
    .line 127
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

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
    sget v1, Ll/kec0;->Z3:I

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->e:Landroid/view/View;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->f:Landroid/widget/ImageView;

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->e:Landroid/view/View;

    .line 80
    .line 81
    new-instance v1, Ll/j6l;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/j6l;-><init>()V

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 93
    .line 94
    if-nez v0, :cond_0

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 97
    .line 98
    const/16 v1, 0x8

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 104
    .line 105
    const/high16 v1, 0x3f800000    # 1.0f

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

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

.method public final p()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->k()Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 16
    .line 17
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

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
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->getRefreshRate()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const v3, 0x3e408312    # 0.188f

    .line 37
    .line 38
    .line 39
    mul-float/2addr v1, v3

    .line 40
    div-float v1, v2, v1

    .line 41
    .line 42
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 60
    .line 61
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 70
    .line 71
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 80
    .line 81
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 94
    .line 95
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 96
    .line 97
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->m()V

    .line 100
    .line 101
    .line 102
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 114
    .line 115
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 124
    .line 125
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 134
    .line 135
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

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

.method public setCoverDrawable(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->e:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->e:Landroid/view/View;

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

.method public setPlaceHolderPic(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->f:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPressed(Z)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;->setPressed(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->getRefreshRate()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const v2, 0x3e28f5c3    # 0.165f

    .line 11
    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    const/high16 v2, 0x3f000000    # 0.5f

    .line 15
    .line 16
    div-float v1, v2, v1

    .line 17
    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->e:F

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    const/high16 v3, 0x3f800000    # 1.0f

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 28
    .line 29
    cmpg-float v4, p1, v2

    .line 30
    .line 31
    if-gez v4, :cond_0

    .line 32
    .line 33
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 34
    .line 35
    const v2, 0x3727c5ac    # 1.0E-5f

    .line 36
    .line 37
    .line 38
    add-float/2addr p1, v2

    .line 39
    iput p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 40
    .line 41
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 42
    .line 43
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->n()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 50
    .line 51
    const/high16 p1, -0x40800000    # -1.0f

    .line 52
    .line 53
    iput p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 54
    .line 55
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->n()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->d:F

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    cmpl-float v4, p1, v4

    .line 65
    .line 66
    if-nez v4, :cond_2

    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    cmpl-float p1, p1, v2

    .line 70
    .line 71
    if-ltz p1, :cond_3

    .line 72
    .line 73
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 74
    .line 75
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 76
    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->n()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->b:F

    .line 84
    .line 85
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 86
    .line 87
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->c:Z

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->n()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public setShowLog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSwipeEnable(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;

    .line 38
    .line 39
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$c;->a:F

    .line 40
    .line 41
    return-void
.end method
