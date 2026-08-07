.class public Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->initDataOnCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/ViewTreeObserver;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;Landroid/view/ViewTreeObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->a:Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->a:Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->a:Landroid/view/ViewTreeObserver;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->k2(Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->l2(Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->c:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->c:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/high16 v3, 0x3f800000    # 1.0f

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 52
    .line 53
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-wide/16 v4, 0x190

    .line 61
    .line 62
    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->e:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_LinearLayout;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    div-int/lit8 v4, v4, 0x2

    .line 78
    .line 79
    int-to-float v4, v4

    .line 80
    invoke-virtual {v0, v4}, Landroid/view/View;->setPivotX(F)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->e:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_LinearLayout;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    mul-int/lit8 v4, v4, 0x2

    .line 92
    .line 93
    int-to-float v4, v4

    .line 94
    invoke-virtual {v0, v4}, Landroid/view/View;->setPivotY(F)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->e:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_LinearLayout;

    .line 100
    .line 101
    const/high16 v4, -0x3e100000    # -30.0f

    .line 102
    .line 103
    invoke-virtual {v0, v4}, Landroid/view/View;->setRotation(F)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup$a;->b:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup;->e:Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_LinearLayout;

    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-wide/16 v3, 0x320

    .line 123
    .line 124
    invoke-virtual {p0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    .line 133
    .line 134
    invoke-direct {v0}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 142
    .line 143
    .line 144
    return v1
.end method
