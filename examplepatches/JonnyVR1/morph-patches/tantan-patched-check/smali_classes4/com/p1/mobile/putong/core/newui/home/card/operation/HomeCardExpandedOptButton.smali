.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;
.super Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

.field public d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/ImageView;

.field public g:Z

.field public h:F

.field public i:Z

.field public j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

.field public k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

.field public l:Z

.field public m:Z

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 61
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/BaseHomeCardExpandedButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 6
    .line 7
    const/high16 p3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->h:F

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->i:Z

    .line 12
    .line 13
    new-instance p3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-direct {p3, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;-><init>(Ll/o6l;)V

    .line 17
    .line 18
    .line 19
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 20
    .line 21
    new-instance p3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 22
    .line 23
    invoke-direct {p3, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;-><init>(Ll/o6l;)V

    .line 24
    .line 25
    .line 26
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 27
    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

    .line 29
    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->m:Z

    .line 31
    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n:Z

    .line 33
    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object p3, Ll/khc0;->K0:[I

    .line 41
    .line 42
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    sget p2, Ll/khc0;->L0:I

    .line 47
    .line 48
    const p3, 0x3fbb404f    # 1.4629f

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->h:F

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public static synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n:Z

    return-void
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

.method private k()Z
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

.method private m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

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

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

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

.method private o()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k()Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 11
    .line 12
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 13
    .line 14
    const/high16 v2, -0x40800000    # -1.0f

    .line 15
    .line 16
    cmpl-float v3, v1, v2

    .line 17
    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :cond_1
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    cmpl-float v3, v3, v4

    .line 26
    .line 27
    const/high16 v5, 0x3f800000    # 1.0f

    .line 28
    .line 29
    if-nez v3, :cond_2

    .line 30
    .line 31
    cmpl-float p0, v1, v5

    .line 32
    .line 33
    if-nez p0, :cond_4

    .line 34
    .line 35
    iget-boolean p0, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->getRefreshRate()F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const v3, 0x3e408312    # 0.188f

    .line 47
    .line 48
    .line 49
    mul-float/2addr v1, v3

    .line 50
    div-float/2addr v5, v1

    .line 51
    iput v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 54
    .line 55
    iput v4, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 56
    .line 57
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 58
    .line 59
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

    .line 60
    .line 61
    const-string v1, "fakeView"

    .line 62
    .line 63
    const-string v2, " , "

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v3, "reset \u6bcf\u6b21\u52a8\u753bdiff: "

    .line 70
    .line 71
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 75
    .line 76
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 85
    .line 86
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 87
    .line 88
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 95
    .line 96
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v1, v0}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->m()V

    .line 109
    .line 110
    .line 111
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

    .line 112
    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v3, "reset \u6bcf\u6b21\u52a8\u753bdiff done: "

    .line 118
    .line 119
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 123
    .line 124
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

    .line 125
    .line 126
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 133
    .line 134
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 135
    .line 136
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {v1, p0}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_4
    :goto_0
    return-void
.end method

.method private p()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k()Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 16
    .line 17
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

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
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->getRefreshRate()F

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
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 60
    .line 61
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 70
    .line 71
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 80
    .line 81
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 94
    .line 95
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 96
    .line 97
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 98
    .line 99
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->m()V

    .line 100
    .line 101
    .line 102
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 114
    .line 115
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 124
    .line 125
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 134
    .line 135
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

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

.method private setClickAlpha(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

    .line 9
    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sub-float/2addr v1, p1

    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->p()V

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->o()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->o()V

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void

    .line 23
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->o()V

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 11
    .line 12
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 13
    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setClickAlpha(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 25
    .line 26
    iget v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 27
    .line 28
    iget v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 29
    .line 30
    iget v5, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

    .line 31
    .line 32
    mul-float/2addr v5, v4

    .line 33
    add-float/2addr v3, v5

    .line 34
    iput v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 35
    .line 36
    cmpl-float v5, v4, p2

    .line 37
    .line 38
    if-nez v5, :cond_0

    .line 39
    .line 40
    cmpl-float v3, v3, p2

    .line 41
    .line 42
    if-lez v3, :cond_1

    .line 43
    .line 44
    iput p2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 45
    .line 46
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 47
    .line 48
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 49
    .line 50
    :goto_0
    move v3, v1

    .line 51
    move p1, v2

    .line 52
    goto :goto_2

    .line 53
    :cond_0
    const/high16 v5, -0x40800000    # -1.0f

    .line 54
    .line 55
    cmpl-float v4, v4, v5

    .line 56
    .line 57
    if-nez v4, :cond_2

    .line 58
    .line 59
    cmpg-float v3, v3, v0

    .line 60
    .line 61
    if-gez v3, :cond_1

    .line 62
    .line 63
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 64
    .line 65
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 66
    .line 67
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    move p1, v1

    .line 71
    :goto_1
    move v3, p1

    .line 72
    goto :goto_2

    .line 73
    :cond_2
    move p1, v1

    .line 74
    move v3, v2

    .line 75
    goto :goto_2

    .line 76
    :cond_3
    move p1, v2

    .line 77
    goto :goto_1

    .line 78
    :goto_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 79
    .line 80
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 81
    .line 82
    const-string v6, " \uff0c "

    .line 83
    .line 84
    const-string v7, "fakeView"

    .line 85
    .line 86
    const-string v8, " , "

    .line 87
    .line 88
    if-eqz v5, :cond_d

    .line 89
    .line 90
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 91
    .line 92
    if-eqz v4, :cond_5

    .line 93
    .line 94
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setClickAlpha(F)V

    .line 95
    .line 96
    .line 97
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 98
    .line 99
    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 100
    .line 101
    .line 102
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 103
    .line 104
    iget-boolean v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 105
    .line 106
    if-nez v5, :cond_4

    .line 107
    .line 108
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 109
    .line 110
    cmpl-float v5, v5, v0

    .line 111
    .line 112
    if-eqz v5, :cond_5

    .line 113
    .line 114
    :cond_4
    iput-boolean v2, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 115
    .line 116
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 117
    .line 118
    move v3, v1

    .line 119
    :cond_5
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 120
    .line 121
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 122
    .line 123
    iget v9, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 124
    .line 125
    iget v10, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

    .line 126
    .line 127
    mul-float/2addr v9, v10

    .line 128
    add-float/2addr v5, v9

    .line 129
    iput v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 130
    .line 131
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

    .line 132
    .line 133
    if-eqz v4, :cond_6

    .line 134
    .line 135
    new-instance v4, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v5, "click anim begin "

    .line 138
    .line 139
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 143
    .line 144
    iget v5, v5, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 145
    .line 146
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 153
    .line 154
    iget v5, v5, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 155
    .line 156
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-static {v7, v4}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 167
    .line 168
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 169
    .line 170
    cmpl-float v9, v5, v0

    .line 171
    .line 172
    if-nez v9, :cond_7

    .line 173
    .line 174
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 175
    .line 176
    cmpg-float v5, v5, v0

    .line 177
    .line 178
    if-gtz v5, :cond_a

    .line 179
    .line 180
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 181
    .line 182
    :goto_3
    move v5, v2

    .line 183
    goto :goto_4

    .line 184
    :cond_7
    const/high16 v9, 0x3f000000    # 0.5f

    .line 185
    .line 186
    cmpl-float v10, v5, v9

    .line 187
    .line 188
    if-nez v10, :cond_9

    .line 189
    .line 190
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 191
    .line 192
    cmpl-float v10, v5, v0

    .line 193
    .line 194
    if-lez v10, :cond_8

    .line 195
    .line 196
    iget v10, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 197
    .line 198
    cmpl-float v10, v10, v9

    .line 199
    .line 200
    if-lez v10, :cond_8

    .line 201
    .line 202
    iput v9, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_8
    cmpg-float v5, v5, v0

    .line 206
    .line 207
    if-gez v5, :cond_a

    .line 208
    .line 209
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 210
    .line 211
    cmpg-float v5, v5, v9

    .line 212
    .line 213
    if-gez v5, :cond_a

    .line 214
    .line 215
    iput v9, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_9
    cmpl-float v5, v5, p2

    .line 219
    .line 220
    if-nez v5, :cond_a

    .line 221
    .line 222
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 223
    .line 224
    cmpl-float v5, v5, p2

    .line 225
    .line 226
    if-lez v5, :cond_a

    .line 227
    .line 228
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 229
    .line 230
    goto :goto_3

    .line 231
    :cond_a
    move v5, v1

    .line 232
    :goto_4
    iget v9, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 233
    .line 234
    cmpg-float v10, v9, v0

    .line 235
    .line 236
    if-ltz v10, :cond_b

    .line 237
    .line 238
    cmpl-float v9, v9, p2

    .line 239
    .line 240
    if-lez v9, :cond_c

    .line 241
    .line 242
    :cond_b
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 243
    .line 244
    move v5, v2

    .line 245
    :cond_c
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

    .line 246
    .line 247
    if-eqz v4, :cond_11

    .line 248
    .line 249
    new-instance v4, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    const-string v9, "click anim end "

    .line 252
    .line 253
    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 257
    .line 258
    iget v9, v9, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 259
    .line 260
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 267
    .line 268
    iget v9, v9, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 269
    .line 270
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 283
    .line 284
    invoke-virtual {v6}, Landroid/view/View;->getAlpha()F

    .line 285
    .line 286
    .line 287
    move-result v6

    .line 288
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v4

    .line 295
    invoke-static {v7, v4}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    goto :goto_5

    .line 299
    :cond_d
    iget v1, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 300
    .line 301
    cmpl-float v4, v1, v0

    .line 302
    .line 303
    if-eqz v4, :cond_e

    .line 304
    .line 305
    cmpl-float v1, v1, p2

    .line 306
    .line 307
    if-nez v1, :cond_f

    .line 308
    .line 309
    :cond_e
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 310
    .line 311
    if-eqz v1, :cond_f

    .line 312
    .line 313
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setClickAlpha(F)V

    .line 314
    .line 315
    .line 316
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 317
    .line 318
    invoke-virtual {v1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 319
    .line 320
    .line 321
    :cond_f
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

    .line 322
    .line 323
    if-eqz v1, :cond_10

    .line 324
    .line 325
    new-instance v1, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    const-string v4, "click anim finish "

    .line 328
    .line 329
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 333
    .line 334
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 335
    .line 336
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 343
    .line 344
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 345
    .line 346
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 353
    .line 354
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 355
    .line 356
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    const-string v4, " \uff0c swipe: "

    .line 360
    .line 361
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 365
    .line 366
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 367
    .line 368
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 375
    .line 376
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 377
    .line 378
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    const-string v4, ","

    .line 382
    .line 383
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 387
    .line 388
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 389
    .line 390
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    const-string v4, ",false"

    .line 394
    .line 395
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-static {v7, v1}, Ll/bnf;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    :cond_10
    move v1, v2

    .line 406
    move v5, v1

    .line 407
    :cond_11
    :goto_5
    if-nez p1, :cond_12

    .line 408
    .line 409
    if-eqz v5, :cond_13

    .line 410
    .line 411
    :cond_12
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 416
    .line 417
    .line 418
    :cond_13
    if-nez v5, :cond_16

    .line 419
    .line 420
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 421
    .line 422
    iget-boolean v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 423
    .line 424
    if-eqz v4, :cond_16

    .line 425
    .line 426
    iget v4, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 427
    .line 428
    cmpl-float v4, v4, p2

    .line 429
    .line 430
    if-nez v4, :cond_14

    .line 431
    .line 432
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 433
    .line 434
    :cond_14
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 435
    .line 436
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 437
    .line 438
    cmpl-float v4, p1, v0

    .line 439
    .line 440
    if-eqz v4, :cond_15

    .line 441
    .line 442
    cmpl-float p1, p1, p2

    .line 443
    .line 444
    if-nez p1, :cond_16

    .line 445
    .line 446
    :cond_15
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 447
    .line 448
    if-eqz p1, :cond_16

    .line 449
    .line 450
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setClickAlpha(F)V

    .line 451
    .line 452
    .line 453
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 454
    .line 455
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 456
    .line 457
    .line 458
    :cond_16
    if-eqz v3, :cond_17

    .line 459
    .line 460
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 461
    .line 462
    if-eqz p1, :cond_17

    .line 463
    .line 464
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 465
    .line 466
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 467
    .line 468
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 469
    .line 470
    invoke-virtual {p1, v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 471
    .line 472
    .line 473
    :cond_17
    if-eqz v1, :cond_18

    .line 474
    .line 475
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 476
    .line 477
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 478
    .line 479
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 480
    .line 481
    rem-float/2addr p0, p2

    .line 482
    invoke-virtual {p1, p0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 483
    .line 484
    .line 485
    :cond_18
    return-void
.end method

.method public final h(Z)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->m:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public l(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n:Z

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v1, v2, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 29
    .line 30
    invoke-virtual {v1, v2, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    sget-object v1, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->AFTER:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 59
    .line 60
    invoke-virtual {p2, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 65
    .line 66
    invoke-virtual {p2, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 67
    .line 68
    .line 69
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 70
    .line 71
    if-eqz p2, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-static {p2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p2, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 96
    .line 97
    .line 98
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

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
    sget v1, Ll/kec0;->b4:I

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
    const/4 v3, -0x1

    .line 22
    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    const/16 v3, 0x11

    .line 26
    .line 27
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    sget v1, Ll/adc0;->e:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 41
    .line 42
    sget v1, Ll/adc0;->z1:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 51
    .line 52
    sget v1, Ll/adc0;->h2:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->e:Landroid/view/View;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 61
    .line 62
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->h:F

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;->setLayoutScale(F)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 68
    .line 69
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->h:F

    .line 70
    .line 71
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;->setLayoutScale(F)V

    .line 72
    .line 73
    .line 74
    sget v1, Ll/adc0;->q0:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Landroid/widget/ImageView;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->e:Landroid/view/View;

    .line 85
    .line 86
    new-instance v1, Ll/n6l;

    .line 87
    .line 88
    invoke-direct {v1}, Ll/n6l;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 95
    .line 96
    .line 97
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 98
    .line 99
    if-nez v0, :cond_0

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 102
    .line 103
    const/16 v1, 0x8

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 106
    .line 107
    .line 108
    const/high16 v0, 0x3f800000    # 1.0f

    .line 109
    .line 110
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setClickAlpha(F)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 114
    .line 115
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 116
    .line 117
    .line 118
    :cond_0
    return-void
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setPressed(Z)V

    .line 8
    .line 9
    .line 10
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

.method public setBgAllShow(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->m:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

    .line 12
    .line 13
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setCoverDrawable(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->d:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->e:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->e:Landroid/view/View;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f:Landroid/widget/ImageView;

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->h(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->getRefreshRate()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const v2, 0x3e28f5c3    # 0.165f

    .line 18
    .line 19
    .line 20
    mul-float/2addr v1, v2

    .line 21
    const/high16 v2, 0x3f000000    # 0.5f

    .line 22
    .line 23
    div-float v1, v2, v1

    .line 24
    .line 25
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->e:F

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->k:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    const/high16 v3, 0x3f800000    # 1.0f

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    iget p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 35
    .line 36
    cmpg-float v4, p1, v2

    .line 37
    .line 38
    if-gez v4, :cond_1

    .line 39
    .line 40
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 41
    .line 42
    const v2, 0x3727c5ac    # 1.0E-5f

    .line 43
    .line 44
    .line 45
    add-float/2addr p1, v2

    .line 46
    iput p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 47
    .line 48
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 49
    .line 50
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 57
    .line 58
    const/high16 p1, -0x40800000    # -1.0f

    .line 59
    .line 60
    iput p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 61
    .line 62
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->d:F

    .line 69
    .line 70
    const/4 v4, 0x0

    .line 71
    cmpl-float v4, p1, v4

    .line 72
    .line 73
    if-nez v4, :cond_3

    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    cmpl-float p1, p1, v2

    .line 77
    .line 78
    if-ltz p1, :cond_4

    .line 79
    .line 80
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 81
    .line 82
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 83
    .line 84
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 85
    .line 86
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->b:F

    .line 91
    .line 92
    iput v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 93
    .line 94
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->c:Z

    .line 95
    .line 96
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->n()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public setShowLog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSwipeEnable(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setClickAlpha(F)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 p1, 0x0

    .line 25
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->setClickAlpha(F)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/view/HomeCardButtonSvgaView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;

    .line 34
    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$b;->a:F

    .line 36
    .line 37
    return-void
.end method
