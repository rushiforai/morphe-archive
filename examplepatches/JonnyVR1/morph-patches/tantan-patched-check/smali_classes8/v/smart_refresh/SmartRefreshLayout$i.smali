.class public Lv/smart_refresh/SmartRefreshLayout$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/smart_refresh/SmartRefreshLayout;->m(IIFZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:F

.field public final synthetic b:I

.field public final synthetic c:Z

.field public final synthetic d:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;FIZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iput p2, p0, Lv/smart_refresh/SmartRefreshLayout$i;->a:F

    .line 4
    .line 5
    iput p3, p0, Lv/smart_refresh/SmartRefreshLayout$i;->b:I

    .line 6
    .line 7
    iput-boolean p4, p0, Lv/smart_refresh/SmartRefreshLayout$i;->c:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 6
    .line 7
    if-eq v1, v2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-wide/16 v1, 0x0

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 20
    .line 21
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    const/high16 v2, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float/2addr v1, v2

    .line 41
    iput v1, v0, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 42
    .line 43
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 44
    .line 45
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 46
    .line 47
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 53
    .line 54
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 55
    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    int-to-float v1, v1

    .line 62
    :goto_0
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout$i;->a:F

    .line 63
    .line 64
    const/high16 v3, 0x41200000    # 10.0f

    .line 65
    .line 66
    cmpg-float v3, v2, v3

    .line 67
    .line 68
    if-gez v3, :cond_3

    .line 69
    .line 70
    mul-float/2addr v2, v1

    .line 71
    :cond_3
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 72
    .line 73
    float-to-int v2, v2

    .line 74
    filled-new-array {v1, v2}, [I

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 83
    .line 84
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 85
    .line 86
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 87
    .line 88
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$i;->b:I

    .line 89
    .line 90
    int-to-long v1, v1

    .line 91
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 95
    .line 96
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 97
    .line 98
    new-instance v1, Ll/rsf0;

    .line 99
    .line 100
    sget v2, Ll/rsf0;->b:I

    .line 101
    .line 102
    invoke-direct {v1, v2}, Ll/rsf0;-><init>(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 109
    .line 110
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    new-instance v1, Lv/smart_refresh/SmartRefreshLayout$i$a;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Lv/smart_refresh/SmartRefreshLayout$i$a;-><init>(Lv/smart_refresh/SmartRefreshLayout$i;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 121
    .line 122
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 123
    .line 124
    new-instance v1, Lv/smart_refresh/SmartRefreshLayout$i$b;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Lv/smart_refresh/SmartRefreshLayout$i$b;-><init>(Lv/smart_refresh/SmartRefreshLayout$i;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 133
    .line 134
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 137
    .line 138
    .line 139
    return-void
.end method
