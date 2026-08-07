.class public Lv/smart_refresh/SmartRefreshLayout$h$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/smart_refresh/SmartRefreshLayout$h;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lv/smart_refresh/SmartRefreshLayout$h;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout$h;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->b:Lv/smart_refresh/SmartRefreshLayout$h;

    .line 2
    .line 3
    iput p2, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->b:Lv/smart_refresh/SmartRefreshLayout$h;

    .line 2
    .line 3
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 4
    .line 5
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->N:Z

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->a:I

    .line 12
    .line 13
    if-gez v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 16
    .line 17
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 18
    .line 19
    invoke-interface {v1, v0}, Ll/hvc0;->c(I)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    filled-new-array {v2, v2}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Landroid/animation/ValueAnimator$AnimatorUpdateListener;->onAnimationUpdate(Landroid/animation/ValueAnimator;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v0, v3

    .line 38
    :cond_1
    :goto_0
    new-instance v1, Lv/smart_refresh/SmartRefreshLayout$h$a$a;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Lv/smart_refresh/SmartRefreshLayout$h$a$a;-><init>(Lv/smart_refresh/SmartRefreshLayout$h$a;)V

    .line 41
    .line 42
    .line 43
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->b:Lv/smart_refresh/SmartRefreshLayout$h;

    .line 44
    .line 45
    iget-object v5, v4, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 46
    .line 47
    iget v6, v5, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 48
    .line 49
    if-lez v6, :cond_2

    .line 50
    .line 51
    iget-object p0, v5, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 52
    .line 53
    invoke-interface {p0, v2}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    goto :goto_3

    .line 58
    :cond_2
    if-nez v0, :cond_6

    .line 59
    .line 60
    if-nez v6, :cond_3

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    iget-boolean p0, v4, Lv/smart_refresh/SmartRefreshLayout$h;->c:Z

    .line 64
    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    iget-boolean p0, v5, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 68
    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    iget p0, v5, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 72
    .line 73
    neg-int v0, p0

    .line 74
    if-lt v6, v0, :cond_4

    .line 75
    .line 76
    sget-object p0, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 77
    .line 78
    invoke-virtual {v5, p0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_4
    iget-object v0, v5, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 83
    .line 84
    neg-int p0, p0

    .line 85
    invoke-interface {v0, p0}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    goto :goto_3

    .line 90
    :cond_5
    iget-object p0, v5, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 91
    .line 92
    invoke-interface {p0, v2}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    goto :goto_3

    .line 97
    :cond_6
    :goto_1
    iget-object v0, v5, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    if-eqz v0, :cond_7

    .line 100
    .line 101
    const-wide/16 v4, 0x0

    .line 102
    .line 103
    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->b:Lv/smart_refresh/SmartRefreshLayout$h;

    .line 107
    .line 108
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 109
    .line 110
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->b:Lv/smart_refresh/SmartRefreshLayout$h;

    .line 116
    .line 117
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 118
    .line 119
    iput-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    :cond_7
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->b:Lv/smart_refresh/SmartRefreshLayout$h;

    .line 122
    .line 123
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 124
    .line 125
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 126
    .line 127
    invoke-interface {v0, v2, v2}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$h$a;->b:Lv/smart_refresh/SmartRefreshLayout$h;

    .line 131
    .line 132
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 133
    .line 134
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 135
    .line 136
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 137
    .line 138
    invoke-interface {p0, v0}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 139
    .line 140
    .line 141
    :goto_2
    move-object p0, v3

    .line 142
    :goto_3
    if-eqz p0, :cond_8

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_8
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method
