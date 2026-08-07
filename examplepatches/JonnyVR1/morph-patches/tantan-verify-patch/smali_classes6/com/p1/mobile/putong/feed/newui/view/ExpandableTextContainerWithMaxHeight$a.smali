.class public Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->C(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->b:I

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->c(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->k(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 19
    .line 20
    new-instance v1, Ll/pf60;

    .line 21
    .line 22
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->a:I

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->b:I

    .line 29
    .line 30
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->j(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->c(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    xor-int/2addr v0, v1

    .line 47
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->h(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->g(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$b;

    .line 53
    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 61
    .line 62
    if-nez v0, :cond_3

    .line 63
    .line 64
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->c(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->l(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->d(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    const/4 v0, 0x0

    .line 78
    if-nez p1, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 81
    .line 82
    const/high16 v1, -0x40000000    # -2.0f

    .line 83
    .line 84
    invoke-static {p1, v1, v0}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->m(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;FZ)V

    .line 85
    .line 86
    .line 87
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 88
    .line 89
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->i(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 93
    .line 94
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->f(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-lez p1, :cond_2

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->c(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_2

    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 109
    .line 110
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->e(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Lv/VText;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1, v0, v0}, Landroid/view/View;->scrollTo(II)V

    .line 115
    .line 116
    .line 117
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 118
    .line 119
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->n(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_3
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->g(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$b;

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 127
    .line 128
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->c(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Z

    .line 129
    .line 130
    .line 131
    throw p1
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->c(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->k(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight$a;->c:Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;->i(Lcom/p1/mobile/putong/feed/newui/view/ExpandableTextContainerWithMaxHeight;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
