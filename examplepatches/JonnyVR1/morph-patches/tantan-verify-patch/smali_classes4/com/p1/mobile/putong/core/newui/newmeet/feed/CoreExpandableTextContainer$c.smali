.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->K(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->l(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 19
    .line 20
    new-instance v1, Landroid/util/Pair;

    .line 21
    .line 22
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->a:I

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->b:I

    .line 29
    .line 30
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->k(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Landroid/util/Pair;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    xor-int/2addr v0, v1

    .line 47
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->i(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->f(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;->a(Z)V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->e(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 84
    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->m(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->n(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V

    .line 100
    .line 101
    .line 102
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 103
    .line 104
    const/high16 v0, -0x40000000    # -2.0f

    .line 105
    .line 106
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->o(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;F)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 110
    .line 111
    const/4 v0, 0x0

    .line 112
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->j(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 116
    .line 117
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$e;

    .line 118
    .line 119
    .line 120
    const/4 p1, 0x0

    .line 121
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_3

    .line 126
    .line 127
    return-void

    .line 128
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 129
    .line 130
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->g(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$e;

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 134
    .line 135
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Landroid/util/Pair;

    .line 136
    .line 137
    .line 138
    throw p1
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->l(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$c;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->j(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
