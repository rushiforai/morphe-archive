.class public Lcom/p1/mobile/putong/core/card/VSwipeCard$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/card/VSwipeCard;->R0(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/card/VSwipeCard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/card/VSwipeCard$a;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->b(Ll/x20;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->J0(Lcom/p1/mobile/putong/core/card/VSwipeCard;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    invoke-static {p1, v2, v3}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->H0(Lcom/p1/mobile/putong/core/card/VSwipeCard;J)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 20
    .line 21
    iput v2, p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 36
    .line 37
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 41
    .line 42
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->I0(Lcom/p1/mobile/putong/core/card/VSwipeCard;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->X(Lcom/p1/mobile/putong/core/card/VSwipeCard;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o1(J)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->J0(Lcom/p1/mobile/putong/core/card/VSwipeCard;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    invoke-static {p1, v2, v3}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->H0(Lcom/p1/mobile/putong/core/card/VSwipeCard;J)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 20
    .line 21
    iput v2, p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 36
    .line 37
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 41
    .line 42
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->I0(Lcom/p1/mobile/putong/core/card/VSwipeCard;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Ll/rzk0;

    .line 60
    .line 61
    invoke-direct {v0}, Ll/rzk0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance v0, Ll/szk0;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/szk0;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeCard$a;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 90
    .line 91
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 96
    .line 97
    .line 98
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 99
    .line 100
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->X(Lcom/p1/mobile/putong/core/card/VSwipeCard;)J

    .line 101
    .line 102
    .line 103
    move-result-wide v0

    .line 104
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o1(J)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 108
    .line 109
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 120
    .line 121
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 126
    .line 127
    invoke-static {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->getBgAlpha()F

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->e(F)V

    .line 136
    .line 137
    .line 138
    :cond_3
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    .line 5
    .line 6
    return-void
.end method
