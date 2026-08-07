.class public Ll/rfq0$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rfq0$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/rfq0$b;

.field public b:Ll/dgq0;


# direct methods
.method public constructor <init>(Landroid/view/View;Ll/rfq0$b;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/rfq0$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/rfq0$c$a;->a:Ll/rfq0$b;

    .line 5
    .line 6
    invoke-static {p1}, Ll/kkl0;->D(Landroid/view/View;)Ll/dgq0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance p2, Ll/dgq0$a;

    .line 13
    .line 14
    invoke-direct {p2, p1}, Ll/dgq0$a;-><init>(Ll/dgq0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Ll/dgq0$a;->a()Ll/dgq0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    :goto_0
    iput-object p1, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isLaidOut()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2, p1}, Ll/dgq0;->x(Landroid/view/WindowInsets;Landroid/view/View;)Ll/dgq0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 12
    .line 13
    invoke-static {p1, p2}, Ll/rfq0$c;->l(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {p2, p1}, Ll/dgq0;->x(Landroid/view/WindowInsets;Landroid/view/View;)Ll/dgq0;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v0, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-static {p1}, Ll/kkl0;->D(Landroid/view/View;)Ll/dgq0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    iput-object v3, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 37
    .line 38
    invoke-static {p1, p2}, Ll/rfq0$c;->l(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_2
    invoke-static {p1}, Ll/rfq0$c;->m(Landroid/view/View;)Ll/rfq0$b;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object v0, v0, Ll/rfq0$b;->a:Landroid/view/WindowInsets;

    .line 50
    .line 51
    invoke-static {v0, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    invoke-static {p1, p2}, Ll/rfq0$c;->l(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :cond_3
    iget-object v0, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 63
    .line 64
    invoke-static {v3, v0}, Ll/rfq0$c;->d(Ll/dgq0;Ll/dgq0;)I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-nez v5, :cond_4

    .line 69
    .line 70
    invoke-static {p1, p2}, Ll/rfq0$c;->l(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_4
    iget-object v4, p0, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 76
    .line 77
    invoke-static {v5, v3, v4}, Ll/rfq0$c;->f(ILl/dgq0;Ll/dgq0;)Landroid/view/animation/Interpolator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v2, Ll/rfq0;

    .line 82
    .line 83
    const-wide/16 v6, 0xa0

    .line 84
    .line 85
    invoke-direct {v2, v5, v0, v6, v7}, Ll/rfq0;-><init>(ILandroid/view/animation/Interpolator;J)V

    .line 86
    .line 87
    .line 88
    const/4 v0, 0x0

    .line 89
    invoke-virtual {v2, v0}, Ll/rfq0;->d(F)V

    .line 90
    .line 91
    .line 92
    const/4 v0, 0x2

    .line 93
    new-array v0, v0, [F

    .line 94
    .line 95
    fill-array-data v0, :array_0

    .line 96
    .line 97
    .line 98
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v2}, Ll/rfq0;->a()J

    .line 103
    .line 104
    .line 105
    move-result-wide v6

    .line 106
    invoke-virtual {v0, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 107
    .line 108
    .line 109
    move-result-object v11

    .line 110
    invoke-static {v3, v4, v5}, Ll/rfq0$c;->e(Ll/dgq0;Ll/dgq0;I)Ll/rfq0$a;

    .line 111
    .line 112
    .line 113
    move-result-object v10

    .line 114
    const/4 v0, 0x0

    .line 115
    invoke-static {p1, v2, p2, v0}, Ll/rfq0$c;->i(Landroid/view/View;Ll/rfq0;Landroid/view/WindowInsets;Z)V

    .line 116
    .line 117
    .line 118
    new-instance v0, Ll/rfq0$c$a$a;

    .line 119
    .line 120
    move-object v1, p0

    .line 121
    move-object v6, p1

    .line 122
    invoke-direct/range {v0 .. v6}, Ll/rfq0$c$a$a;-><init>(Ll/rfq0$c$a;Ll/rfq0;Ll/dgq0;Ll/dgq0;ILandroid/view/View;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v11, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 126
    .line 127
    .line 128
    new-instance p0, Ll/rfq0$c$a$b;

    .line 129
    .line 130
    invoke-direct {p0, v1, v2, v6}, Ll/rfq0$c$a$b;-><init>(Ll/rfq0$c$a;Ll/rfq0;Landroid/view/View;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v11, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 134
    .line 135
    .line 136
    move-object v8, v6

    .line 137
    new-instance v6, Ll/rfq0$c$a$c;

    .line 138
    .line 139
    move-object v7, v1

    .line 140
    move-object v9, v2

    .line 141
    invoke-direct/range {v6 .. v11}, Ll/rfq0$c$a$c;-><init>(Ll/rfq0$c$a;Landroid/view/View;Ll/rfq0;Ll/rfq0$a;Landroid/animation/ValueAnimator;)V

    .line 142
    .line 143
    .line 144
    move-object p0, v6

    .line 145
    move-object v6, v8

    .line 146
    invoke-static {v6, p0}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 147
    .line 148
    .line 149
    iput-object v3, v1, Ll/rfq0$c$a;->b:Ll/dgq0;

    .line 150
    .line 151
    invoke-static {v6, p2}, Ll/rfq0$c;->l(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    nop

    .line 157
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
